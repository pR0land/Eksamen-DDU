#include <WiFi.h>
#include <HardwareSerial.h>

#define RXD2 16
#define TXD2 17
//HardwareSerial Serial1(1);

const char* ssid = "esp32";
const char* pass = "12345679";

String portRead;

int intruders;

int lokaleNr = 1;
int lastIntruders;
String lN;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
/*  delay(10);
  WiFi.begin(ssid,pass);
  Serial.print("Connecting.");
    while(WiFi.status() != WL_CONNECTED) {
        Serial.print(".");
        delay(500);
    }

    Serial.print("WiFi connected - IP address: ");
    Serial.println(WiFi.localIP());
    delay(500);
  lastIntruders = intruders;
  lN = String(lokaleNr);
  Serial.println(lN);
  */
  Serial1.begin(9600, SERIAL_8N1,RXD2,TXD2);
}

void loop() {
  if(Serial1.available()){
    String incommingData = Serial1.readString();
    int komma = incommingData.indexOf(",");
    String incommingIntruders = incommingData.substring(0,komma);
    Serial.print(incommingIntruders);
    //Serial.print(fs);
  }
  /*
  if(intruders != lastIntruders){
    const uint16_t port = 7000;
    WiFiClient client;
    if(client.connect("192.168.0.164",port)){
     client.print(lN);
     client.print(",");
     client.print(String(intruders));
     client.stop();
     lastIntruders = intruders;
    }
  }
  */
  //Serial.println(intruders);
  //Serial.println(analogRead(sensor2));
//delay(100);
}
