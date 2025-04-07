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

### Stage 3: Connecting ESP32 to Wi-Fi

### Stage 4: Linking ESP32 with Firebase
To enable communication between the ESP32 and Firestore, we used this [FirebaseClient](https://github.com/mobizt/FirebaseClient) library. This allows the ESP32 to read from and write to Firestore.

