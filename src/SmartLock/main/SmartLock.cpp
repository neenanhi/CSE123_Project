#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include "DFRobot_LCD.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "nvs_flash.h"
#include "esp_log.h"
#include "esp_netif.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#define WIFI_SSID "SSID"
#define WIFI_PASS "PASS"

static const char *TAG = "WIFI_CLIENT";
static bool wifi_connected = false; // Track Wi-Fi connection state

// Wi-Fi event handler
static void wifi_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data) {
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        wifi_connected = true;
        ESP_LOGI(TAG, "Wi-Fi Connected");
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_connected = false;
        ESP_LOGW(TAG, "Wi-Fi Disconnected! Reconnecting...");
        esp_wifi_connect();
    }
}

// Initialize Wi-Fi in station mode
void wifi_init_sta(void) {
    ESP_LOGI(TAG, "Initializing Wi-Fi...");

    // Initialize TCP/IP stack
    esp_netif_init();
    esp_event_loop_create_default();
    esp_netif_create_default_wifi_sta();

    // Initialize Wi-Fi
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    esp_wifi_init(&cfg);

    // Register event handlers
    esp_event_handler_instance_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL, NULL);
    esp_event_handler_instance_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL, NULL);

    // Configure Wi-Fi
    wifi_config_t wifi_config = {
        .sta = {
            .ssid = WIFI_SSID,
            .password = WIFI_PASS,
        },
    };

    // Set Wi-Fi mode and start Wi-Fi
    esp_wifi_set_mode(WIFI_MODE_STA);
    esp_wifi_set_config(WIFI_IF_STA, &wifi_config);
    esp_wifi_start();
}

// Function to update the LCD display
void displayLockState(DFRobot_LCD &lcd, int lockState, bool wifiState) {
    lcd.clear(); // Clear the display before printing new text

    if (lockState) {
        lcd.printstr("LOCKED");
    } else {
        lcd.printstr("UNLOCKED");
    }

    lcd.setCursor(0, 1); // Move to second line
    if (wifiState) {
        lcd.printstr("WiFi Connected");
    } else {
        lcd.printstr("WiFi Disconnected");
    }
}

// Main application
extern "C" void app_main(void) {
    // Initialize NVS (Non-Volatile Storage)
    ESP_ERROR_CHECK(nvs_flash_init());

    // Start Wi-Fi
    wifi_init_sta();

    // Delay to ensure Wi-Fi connection
    vTaskDelay(pdMS_TO_TICKS(5000));

    // Initialize LCD
    DFRobot_LCD lcd(16, 2); // LCD with 16 columns, 2 rows
    lcd.init();
    lcd.setRGB(0, 255, 0); // Green backlight

    int lockState = 0; // Initially unlocked

    while (1) {
        // Update LCD with current lock state and Wi-Fi status
        displayLockState(lcd, lockState, wifi_connected);

        vTaskDelay(pdMS_TO_TICKS(2000)); // Wait 10 seconds
        lockState = !lockState; // Toggle lock state (for testing)
    }
}
