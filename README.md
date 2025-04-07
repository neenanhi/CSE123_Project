# Auto Smart Lock

A secure and convenient system to control a smart lock remotely using a smartphone and cloud services.

---

### Table of Contents
1. [Introduction](#introduction)
2. [Key Components](#key-components)
3. [Stages of Development](#stages-of-development)
   - [Stage 1: Setting Up Firebase](#stage-1-setting-up-firebase)
   - [Stage 2: Connecting Mobile App to Firebase](#stage-2-connecting-mobile-app-to-firebase)
   - [Stage 3: Connecting ESP32 to Wi-Fi](#stage-3-connecting-esp32-to-wi-fi)
   - [Stage 4: Linking ESP32 with Firebase](#stage-4-linking-esp32-with-firebase)

---

### 🛠️ Introduction
The **Auto Smart Lock** is a Wifi-based system designed to remotely control an electronic door lock using a smartphone. It combines a Firebase cloud backend with a custom mobile app and an ESP32-C3 microcontroller to manage data, security, and remote access.

---

### 🔧 Key Components
- **ESP32-C3 Microcontroller**
(Handles Wi-Fi communication and lock control logic)
- **Firebase Firestore** (Cloud database to store and sync lock states)
- **Mobile App** (Acts as a digital key to control the lock)
- **DC 12V Solenoid Electric Door Lock**
- **Keypad** (Optional physical entry method)
- **Rechargeable Power Bank** (Provides portable power to the lock)

---

## Stages of Development

### Stage 1: Setting Up Firebase
To store and manage authentication and device data, we used [Firebase Firestore](https://firebase.google.com/docs/firestore) as our cloud database.

#### Steps:
1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Cloud Firestore** in Firebase.
3. Configure Firestore security rules (restrict access as needed).
4. Get Firebase configuration keys (`apiKey`, `authDomain`, etc.).

### Stage 2: Connecting the Mobile App to Firebase
1. Initialize Firebase in mobile app using config keys from Stage 1.
2. Set up Firebase SDKs for Firestore and authentication.

### Stage 3: Connecting ESP32-C3 to Wi-Fi
The ESP32-C3 was configured to connect to a local Wi-Fi network. We follow this tutorial to set up Wi-Fi in station (STA) mode:
🔗 [ESP32 Wi-Fi Station (STA) Mode - Random Nerd Tutorials](https://randomnerdtutorials.com/esp32-wi-fi-manager-esp32/)

#### Steps:
- Call `WiFi.begin(ssid, password)` to connect to the router.
- Monitor connection status using `WiFi.status()`.
- Print the IP address to the Serial Monitor once connected.

### Stage 4: Linking ESP32 with Firebase
To enable communication between the ESP32 and Firestore, we used the [FirebaseClient](https://github.com/mobizt/FirebaseClient) library. This allows the ESP32 to read from and write to Firestore documents.

We followed the [FirebaseClient GitHub documentation](https://github.com/mobizt/FirebaseClient) and used this YouTube tutorial for initial setup with the ESP32-C3:  
📺 [ESP32-C3 Firebase Tutorial – YouTube](https://www.youtube.com/watch?v=md1uEOnau5k)

We also referred to the example project below:

#### 🔧 ESP32-C3 Firestore Database Example

##### Requirements:
1. [Install Arduino IDE](https://www.arduino.cc/en/software).
2. Follow [YouTube](https://www.youtube.com/watch?v=md1uEOnau5k) tutorial for setting up ESP32-C3.
3. Refer to the [FirebaseClient GitHub](https://github.com/mobizt/FirebaseClient) for detailed library setup.
4. Make a copy of the `secrets.h.example` file as `secrets.h` and fill in your credentials.

##### Running it:
- Open the Arduino IDE.
- Select your ESP32-C3 board and port.
- Open the sketch.
- Upload the code to your ESP32-C3 board.