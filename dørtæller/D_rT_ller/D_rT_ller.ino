#include <WiFi.h>
#include <HardwareSerial.h>

#define RXD2 16
#define TXD2 17
//HardwareSerial Serial1(1);

const char* ssid = "USERNAME";
const char* pass = "PASSWORD";

String portRead;

int lokaleNr = 1;
String lastIntruders ="";
String incommingIntruders = "";
String lN;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  delay(10);
  WiFi.begin(ssid,pass);
  Serial.print("Connecting.");
    while(WiFi.status() != WL_CONNECTED) {
        Serial.print(".");
        delay(500);
    }

    Serial.print("WiFi connected - IP address: ");
    Serial.println(WiFi.localIP());
    delay(500);
  lastIntruders != incommingIntruders;
  lN = String(lokaleNr);
  Serial.println(lN);
  
  Serial1.begin(9600, SERIAL_8N1,RXD2,TXD2);
}

void loop() {
  if(Serial1.available()){
    String incommingData = Serial1.readString();
    int lastKomma = incommingData.lastIndexOf(",");
    int secondLastKomma = incommingData.lastIndexOf(",",lastKomma -1);
    if(secondLastKomma > 0){
      incommingIntruders = incommingData.substring(secondLastKomma+1,lastKomma);
    }else{
      incommingIntruders = incommingData.substring(0,lastKomma);
    }
    Serial.println(incommingData);
  }
  
  if(incommingIntruders != lastIntruders){
    const uint16_t port = 7000;
    WiFiClient client;
    if(client.connect("192.168.0.164",port)){
     client.print(lN);
     client.print(",");
     client.print(incommingIntruders);
     client.stop();
     lastIntruders = incommingIntruders;
    }
  }
  
  //Serial.println(intruders);
  //Serial.println(analogRead(sensor2));
//delay(100);
}
