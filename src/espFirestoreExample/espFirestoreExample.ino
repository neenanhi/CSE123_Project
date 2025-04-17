/**
 * ABOUT:
 *
 * The example to perform batch get multiple Firestore documents.
 *
 * This example uses the ServiceAuth class for authentication.
 * See examples/App/AppInitialization for more authentication examples.
 *
 * The OAuth2.0 authentication or access token authorization is required for performing the batch get multiple Firestore documents.
 *
 * The complete usage guidelines, please read README.md or visit https://github.com/mobizt/FirebaseClient
 *
 * SYNTAX:
 *
 * 1.------------------------
 *
 * Firestore::Documents::batchGet(<AsyncClient>, <Firestore::Parent>, <BatchGetDocumentOptions>, <AsyncResultCallback>, <uid>);
 *
 * <AsyncClient> - The async client.
 * <Firestore::Parent> - The Firestore::Parent object included project Id and database Id in its constructor.
 * <BatchGetDocumentOptions> - The BatchGetDocumentOptions object which provided the member functions to construct the requst body.
 * <AsyncResultCallback> - The async result callback (AsyncResultCallback).
 * <uid> - The user specified UID of async result (optional).
 *
 * The Firebase project Id should be only the name without the firebaseio.com.
 * The Firestore database id should be (default) or empty "".
 *
 * The following are the BatchGetDocumentOptions member functions.
 *
 * BatchGetDocumentOptions::documents - Adding the document path to read.
 * BatchGetDocumentOptions::mask - Setting the mask fields to return. If not set, returns all fields.
 *
 * If the document has a field that is not present in this mask, that field will not be returned in the response. Use comma (,) to separate between the field names.
 *
 * The union field consistency_selector
 *
 * BatchGetDocumentOptions::transaction - Rreading the document in a transaction. A base64-encoded string.
 * BatchGetDocumentOptions::newTransaction - Creating the transaction.
 * BatchGetDocumentOptions::readTime - Setting the documents as they were at the given time. This may not be older than 270 seconds.
 */

#include <Arduino.h>
#include <FirebaseClient.h>
#include "ExampleFunctions.h" // Provides the functions used in the examples.
#include "secrets.h"          // Provides all the authentication
#define LED_BUILTIN 1         // Using GPIO 1 for the LED lights

void processData(AsyncResult &aResult);
void batch_get_async(BatchGetDocumentOptions &options);
void batch_get_async2(BatchGetDocumentOptions &options);
void batch_get_await(BatchGetDocumentOptions &options);

// ServiceAuth is required for Google Cloud Functions functions.
ServiceAuth sa_auth(FIREBASE_CLIENT_EMAIL, FIREBASE_PROJECT_ID, PRIVATE_KEY, 3000 /* expire period in seconds (<= 3600) */);

FirebaseApp app;

SSL_CLIENT ssl_client;

// This uses built-in core WiFi/Ethernet for network connection.
// See examples/App/NetworkInterfaces for more network examples.
using AsyncClient = AsyncClientClass;
AsyncClient aClient(ssl_client);

Firestore::Documents Docs;

AsyncResult firestoreResult;

bool taskCompleted = false;
bool isWiFiConnected = false;

void setup()
{
    Serial.begin(115200);
    pinMode(LED_BUILTIN, OUTPUT);

    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

    Serial.print("Connecting to Wi-Fi");
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        digitalWrite(LED_BUILTIN, HIGH);
        delay(300);
        digitalWrite(LED_BUILTIN, LOW);
        delay(300);
    }
    Serial.println();
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    isWiFiConnected = true; // <- Set here after WiFi is confirmed!

    Firebase.printf("Firebase Client v%s\n", FIREBASE_CLIENT_VERSION);

    set_ssl_client_insecure_and_buffer(ssl_client);

    app.setTime(get_ntp_time());

    Serial.println("Initializing app...");
    initializeApp(aClient, app, getAuth(sa_auth), auth_debug_print, "🔐 authTask");

    app.getApp<Firestore::Documents>(Docs);
}

unsigned long lastPollTime = 0; // Track the last time Firestore was queried
const unsigned long pollInterval = 10000; // Poll every 10 seconds (adjust as needed)

void loop()
{
    // To maintain the authentication and async tasks
    app.loop();

    bool currentWiFiStatus = (WiFi.status() == WL_CONNECTED);

    // If WiFi status changed
    if (currentWiFiStatus != isWiFiConnected)
    {
        isWiFiConnected = currentWiFiStatus;

        if (isWiFiConnected)
        {
            Serial.println("WiFi reconnected!");
            digitalWrite(LED_BUILTIN, HIGH);
        }
        else
        {
            Serial.println("WiFi lost!");
        }
    }

    // If WiFi is not connected, blink LED and skip Firestore tasks
    if (!isWiFiConnected)
    {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(300);
        digitalWrite(LED_BUILTIN, LOW);
        delay(300);
        return; // Skip the rest of loop
    }

    // If WiFi is connected, proceed as usual
    unsigned long currentTime = millis();

    if (currentTime - lastPollTime >= pollInterval)
    {
        lastPollTime = currentTime;

        BatchGetDocumentOptions options;
        options.documents("users/FuduqA91EfdHhEA8JAQNJ3SwrRJ2");
        options.mask(DocumentMask("isLocked"));

        batch_get_async(options);
    }

    processData(firestoreResult);
}

void processData(AsyncResult &aResult)
{
    // Exits when no result available when calling from the loop.
    if (!aResult.isResult())
        return;

    if (aResult.isEvent())
    {
        Firebase.printf("Event task: %s, msg: %s, code: %d\n", aResult.uid().c_str(), aResult.eventLog().message().c_str(), aResult.eventLog().code());
    }

    if (aResult.isDebug())
    {
        Firebase.printf("Debug task: %s, msg: %s\n", aResult.uid().c_str(), aResult.debug().c_str());
    }

    if (aResult.isError())
    {
        Firebase.printf("Error task: %s, msg: %s, code: %d\n", aResult.uid().c_str(), aResult.error().message().c_str(), aResult.error().code());
    }

    if (aResult.available())
    {
        Firebase.printf("task: %s, payload: %s\n", aResult.uid().c_str(), aResult.c_str());
    }
}

void batch_get_async(BatchGetDocumentOptions &options)
{
    Serial.println("Getting multiple documents...");

    // Async call with callback function.
    Docs.batchGet(aClient, Firestore::Parent(FIREBASE_PROJECT_ID), options, processData, "batchGetTask");
}

void batch_get_async2(BatchGetDocumentOptions &options)
{
    Serial.println("Getting multiple documents...");

    // Async call with AsyncResult for returning result.
    Docs.batchGet(aClient, Firestore::Parent(FIREBASE_PROJECT_ID), options, firestoreResult);
}

void batch_get_await(BatchGetDocumentOptions &options)
{
    Serial.println("Getting multiple documents...");

    // Sync call which waits until the payload was received.
    String payload = Docs.batchGet(aClient, Firestore::Parent(FIREBASE_PROJECT_ID), options);
    if (aClient.lastError().code() == 0)
        Serial.println(payload);
    else
        Firebase.printf("Error, msg: %s, code: %d\n", aClient.lastError().message().c_str(), aClient.lastError().code());
}
