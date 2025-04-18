# ESP32-C3 Firestore database example

### Requirements:
1. [Install Arduino IDE](https://www.arduino.cc/en/software).
2. Follow [YouTube](https://www.youtube.com/watch?v=md1uEOnau5k) tutorial for setting up ESP32-C3.
3. Follow [GitHub](https://github.com/mobizt/FirebaseClient) documentation for setting up firebase, it is a firebase client library for arduino.
4. Make a copy of the `secrets.h.example` file as `secrets.h` and fill in the fields.

### Running it:
* Open the Arduino IDE, then sketch and upload onto the ESP32-C3 board.

### Libraries:
1. ArduinoJson by Benoit Blanchon.
2. Firebase Arduino Client Library for ESP8266 and ESP32 by Mobizt.
3. FirebaseClient by Mobizt.

### Boards Manager Additions:
1. Arduino AVR Boards by Arduino
2. esp32 by Espressif Systems

### First Run Instructions:
#### (Assuming Firestore Cloud Up and Running)

1. Download both espFirebase.ino and secrets.h.example in the current repo.
2. Open both files within same Arduino IDE. 
3. Replace all definitions with credentials necessary to access your firestore cloud. (Including the Private Key)
4. Rename your "secrets.h.example" to "secrets.h".