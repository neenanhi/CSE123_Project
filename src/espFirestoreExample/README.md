# ESP32-C3 Firestore database example

### Requirements:
1. [Install Arduino IDE](https://www.arduino.cc/en/software).
2. Follow [YouTube](https://www.youtube.com/watch?v=md1uEOnau5k) tutorial for setting up ESP32-C3.
3. Follow [GitHub](https://github.com/mobizt/FirebaseClient) documentation for setting up firebase, it is a firebase client library for arduino.
4. Make a copy of the `secrets.h.example` file as `secrets.h` and fill in the fields.

### Running it:
* Open the Arduino IDE, then sketch and upload onto the ESP32-C3 board.

### Libraries:
1. ArduinoJson by Benoit Blanchon (7.4.1).
2. Firebase Arduino Client Library for ESP8266 and ESP32 by Mobizt (v4.4.17).
3. FirebaseClient by Mobizt (2.0.3).
4. WiFiManager by tzapu (2.0.17).
5. Keypad by Mark Stanley, Alexander Brevig (3.1.1).

### Boards Manager Additions:
1. Arduino AVR Boards by Arduino (v2.0.18-arduino.5).
2. esp32 by Espressif Systems (v3.2.0).

### First Run Instructions:
#### (Assuming Firestore Cloud Up and Running)

1. Download both espFirebase.ino and secrets.h.example in the current repo.
2. Open both files within same Arduino IDE. 
3. Replace all definitions with credentials necessary to access your firestore cloud. (Including the Private Key)
4. Rename your "secrets.h.example" to "secrets.h".
5. Upload sketch and observe in the 115200 baud monitor the status of your esp.
6. Once the sketch uploads and the 115200 monitor opens, the ESP will connect to Wi-Fi, then fetch the lock status from Firestore and display either "locked" or "unlocked."

### Hardware Materials requirements
1. [4x4 Matrix Keypad](https://www.mouser.com/ProductDetail/Adafruit/3844?qs=qSfuJ%252Bfl%2Fd6WS5%252BJGim1hw%3D%3D&utm_source=electronicwings&utm_medium=referral&utm_campaign=mouser-componentlisting&_gl=1*1l8bxhz*_ga*MTcxNDc3NzEzMS4xNzQzNjM2NTI1*_ga_15W4STQT4T*MTc0MzYzNjUyNC4xLjEuMTc0MzYzNjUzOS40NS4wLjA.) x 1
2. [DC 12V Solenoid Lock](https://www.amazon.com/dp/B0D8BD6R35?&linkCode=sl1&tag=zlufy-20&linkId=2d5df078eda52bfc049c2a2ee22b0b35&language=en_US&ref_=as_li_ss_tl) x 1
3. [ESP32-C3](https://www.espressif.com/en/products/devkits) x 1
4. [IRFZ44N Mosfet](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.infineon.com/dgdl/Infineon-IRFZ44N-DataSheet-v01_01-EN.pdf?fileId=5546d462533600a40153563b3a9f220d) x 1
5. Jumper wires x 20 (approx)
6. Small LEDs x 1
