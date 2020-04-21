#include <WiFi.h>
const char* ssid = "FTTH_GI2416";
const char* pass = "effak3omGiud";

#define sensor1 33
#define sensor2 32
int a[10];
int b[10];
int display1;
int display2;
int aTotal;
int bTotal;
int averageSens1;
int averageSens2;
int intruders;
boolean armed;
boolean in;
boolean in2;
boolean inThrough;
boolean out;
boolean out2;
boolean outThrough;
boolean middleIn;
boolean middleOut;

int lokaleNr = 1;
int lastIntruders;
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
  analogSetWidth(10);
  lastIntruders = intruders;
  lN = String(lokaleNr);
  Serial.println(lN);
}

void loop() {
//Læs på sensoren 10 gange og læg de 10 målinger i et array
for(int i = 0;i<11;i++){
    display1 = analogRead(sensor1);
    a[i] = display1;
  }
//Læs på sensoren 10 gange og læg de 10 målinger i et array
for(int i = 0;i<11;i++){
    display2 = analogRead(sensor2);
    b[i] = display2;
}

//Læg værdierne af 10 målinger sammen
aTotal = a[0]+a[1]+a[2]+a[3]+a[4]+a[5]+a[6]+a[7]+a[8]+a[9];
//Lav et gennemsnit af de 10 målinger 
averageSens1 = aTotal/10;
//Læg værdierne af 10 målinger sammen
bTotal = b[0]+b[1]+b[2]+b[3]+b[4]+b[5]+b[6]+b[7]+b[8]+b[9];
//Lav et gennemsnit af de 10 målinger
averageSens2 = bTotal/10;

//Er døråbningen fri?
if(averageSens1 <= 200 && averageSens2 <= 200){
  armed = true;
}

if(averageSens1 > 200){
    in = true;
  }
if(in == true){
  if(averageSens2 > 200){
      middleIn = true;
    }
  else if(averageSens1 <= 200){
    in = false;
  }
}  
if(middleIn == true){
  if(averageSens1 < 200){
    in2 = true;
    in = false;
    middleIn = false;
    }
   else if(averageSens2 < 200){
   in2 = false;
   in = true;
   middleIn = false;
   }
}
if(in2 == true){
  if(averageSens2 < 200){
    in2 = false;
    inThrough = true;
  }
  if(averageSens1 > 200){
    middleIn = true;
  }
}

while(inThrough == true){
  intruders++;
  inThrough = false;
  break;
}

if(averageSens2 > 200){
    out = true;
  }
if(out == true){
  if(averageSens1 > 200){
      middleOut = true;
    }
  else if(averageSens2 <= 200){
    out = false;
  }
}  
if(middleOut == true){
  if(averageSens2 < 200){
    out2 = true;
    out = false;
    middleOut = false;
    }
   else if(averageSens1 < 200){
   out2 = false;
   out = true;
   middleOut = false;
   }
}
if(out2 == true){
  if(averageSens1 < 200){
    out2 = false;
    outThrough = true;
  }
  if(averageSens2 > 200){
    middleOut = true;
  }
}

while(outThrough == true){
  intruders--;
  if(intruders <= 0){
    intruders = 0;
  }
  outThrough = false;
  break;
  }

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
  //Serial.println(intruders);
  //Serial.println(analogRead(sensor2));
//delay(100);
}
