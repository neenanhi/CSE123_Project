### Table of Contents
1. [Introduction](#introduction)
2. [Key Components](#key-components)
3. [Stages of Development](#stages-of-development)
   - [Stage 1: Setting Up Firebase](#stage-1-setting-up-firebase)
   - [Stage 2: Connecting the Mobile App to Firebase](#stage-2-connecting-the-mobile-app-to-firebase)
   - [Stage 3: Connecting ESP32 to Wi-Fi](#stage-3-connecting-esp32-to-wi-fi)
   - [Stage 4: Linking ESP32 with Firebase](#stage-4-linking-esp32-with-firebase)

---

### Introduction
The **Auto Smart Lock** is designed to provide a secure and convenient way to control a lock remotely using a smartphone (key). The system utilizes a WiFi enabled ESP32C3 microcontroller, Firebase as a real time cloud database, and a mobile application for the key's functionality. 

---

### Key Components
* ESP32C3 Microcontroller
* Firebase Database
* Mobile App
* Servo motor

## Stages of Development

### Stage 1: Setting Up Firebase

### Stage 2: Connecting the Mobile App to Firebase

### Stage 3: Connecting ESP32 to Wi-Fi

### Stage 4: Linking ESP32 with Firebase
1. **Install Required Libraries**: We installed the `Firebase_Arduino_Client_Library_for_ESP8266_and_ESP32` along with `WiFi` and `ArduinoJson` libraries in Arduino IDE.
2. **Set Up Firebase Credentials**: We created a Firebase project, enabled authentication, and obtained the database URL and API key.
3. **Initialize Wi-Fi Connection**: The ESP32C3 was programmed to connect to a specified Wi-Fi network using `WiFi.begin(ssid, password)`.
4. **Authenticate with Firebase**: We used the Firebase client library to authenticate the ESP32C3 with Firebase using the database URL and an authentication token.
5. **Read and Write Data**: The ESP32C3 successfully sent and retrieved data from Firebase using `Firebase.set()` and `Firebase.get()` functions, allowing real-time communication with the mobile app.
