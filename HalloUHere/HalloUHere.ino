int a[10];
int b[10];
int pinHigh = 10;
int sensor1 = A1;
int sensor2 = A2;
int display1;
int display2;
int aTotal;
int bTotal;
int averageSens1;
int averageSens2;
int intruders;
int newDay = 86400000; //denne svarer til 24 timer i millisekunder
int daysGoneBy =1;
int dørBreddeVærdi;
boolean armed;
boolean in;
boolean in2;
boolean inThrough;
boolean out;
boolean out2;
boolean outThrough;
boolean middleIn;
boolean middleOut;

String lastStringToWrite ="";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  dørBreddeVærdi = 130;
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
if(averageSens1 <= dørBreddeVærdi && averageSens2 <= dørBreddeVærdi){
  armed = true;
}

if(averageSens1 > dørBreddeVærdi){
    in = true;
  }
if(in == true){
  if(averageSens2 > dørBreddeVærdi){
      middleIn = true;
    }
  else if(averageSens1 <= dørBreddeVærdi){
    in = false;
  }
}  
if(middleIn == true){
  if(averageSens1 < dørBreddeVærdi){
    in2 = true;
    in = false;
    middleIn = false;
    }
   else if(averageSens2 < dørBreddeVærdi){
   in2 = false;
   in = true;
   middleIn = false;
   }
}
if(in2 == true){
  if(averageSens2 < dørBreddeVærdi){
    in2 = false;
    inThrough = true;
  }
  if(averageSens1 > dørBreddeVærdi){
    middleIn = true;
  }
}

if(inThrough == true){
  intruders++;
  inThrough = false;
  }

if(averageSens2 > dørBreddeVærdi){
    out = true;
  }
if(out == true){
  if(averageSens1 > dørBreddeVærdi){
      middleOut = true;
    }
  else if(averageSens2 <= dørBreddeVærdi){
    out = false;
  }
}  
if(middleOut == true){
  if(averageSens2 < dørBreddeVærdi){
    out2 = true;
    out = false;
    middleOut = false;
    }
   else if(averageSens1 < dørBreddeVærdi){
   out2 = false;
   out = true;
   middleOut = false;
   }
}
if(out2 == true){
  if(averageSens1 < dørBreddeVærdi){
    out2 = false;
    outThrough = true;
  }
  if(averageSens2 > dørBreddeVærdi){
    middleOut = true;
  }
}

if(outThrough == true){
  intruders--;
  if(intruders <= 0){
    intruders = 0;
    }
  outThrough = false;
  }
  if( int(millis()/newDay)> daysGoneBy){
    intruders = 0;
    daysGoneBy++;
  }
  String stringToWrite = String(intruders)+=",";
  if(lastStringToWrite != stringToWrite){
    Serial.print(stringToWrite);
    lastStringToWrite = stringToWrite;
  }
 // Serial.println(averageSens1);
//delay(100);
}
