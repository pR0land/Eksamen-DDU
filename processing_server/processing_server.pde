import processing.net.*;
int programState =1;
int lokaleNrX, lokaleNrY = 130, lokaleMaxX, lokaleMaxY = 180; 
int inputBarWidth = 200, inputBarHeight = 20, buttonWidth = 75, buttonHeight = 20;
boolean lokaleNrPressed = false, maxMenneskerPressed = false, halfSecondStage = false;

long lastMillis;

String lokaleNumberEntered = "", maxMenneskerEntered = "";

ArrayList<Lokale> lokaler;

Server testServer;

void setup(){
 size(600,600);
 testServer = new Server(this,7000);
 println(Server.ip());
 lokaleNrX = width/3;
 lokaleMaxX = width/3;
}
void draw(){
  if(millis() > lastMillis +500){
    halfSecondStage = !halfSecondStage;
    lastMillis = millis();
  }
  if(programState ==1){
    background(255);
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("SETUP",width/2,50);
    
    //opret lokale
    textSize(17);
    text("Opret nyt lokale:", width/2,90);
    
    //lokale nr bar
    textSize(12);
    fill(0);
    textAlign(CORNER);
    text("Lokale Nr:", width/3,122);
    if(isInsideRect(lokaleNrX,lokaleNrY,inputBarWidth,inputBarHeight)){
     fill(230);
     strokeWeight(1.7);
    }else{
     fill(240);
     strokeWeight(1.2);
    }
    rect(lokaleNrX,lokaleNrY,inputBarWidth,inputBarHeight);
    strokeWeight(1);
    
    //lokale maks antal bar
    textSize(12);
    fill(0);
    textAlign(CORNER);
    text("Maks antal mennesker i lokalet:", width/3,172);
    if(isInsideRect(lokaleMaxX,lokaleMaxY,inputBarWidth,inputBarHeight)){
     fill(230);
     strokeWeight(1.7);
    }else{
     fill(240);
     strokeWeight(1.2);
    }
    rect(lokaleMaxX,lokaleMaxY,inputBarWidth,inputBarHeight);
    strokeWeight(1);
    
    //opret lokale knap
    if(isInsideRect(width/2-(buttonWidth/2),230-(buttonHeight/2),buttonWidth,buttonHeight)){
     fill(230);
     strokeWeight(1.7);
    }else{
     fill(240);
     strokeWeight(1.2);
    }
    rectMode(CORNER);
    rect(width/2-(buttonWidth/2),230-(buttonHeight/2),buttonWidth,buttonHeight);
    rectMode(CORNER);
    textSize(10);
    fill(0);
    textAlign(CENTER);
    text("OPRET LOKALE", width/2,233);
    textAlign(CORNER);
    
    //hvis man har trykket i lokalefeltet
    String textShownLokale ="";
    if(lokaleNrPressed == true){
      if(halfSecondStage && lokaleNumberEntered == ""){
        textShownLokale = "|";
      }else if(halfSecondStage && lokaleNumberEntered != ""){
        textShownLokale = lokaleNumberEntered +"|";
      }else{
        textShownLokale = lokaleNumberEntered; 
      }
    }else if(lokaleNrPressed == false && lokaleNumberEntered != ""){
        textShownLokale = lokaleNumberEntered; 
    }
    if(textShownLokale != null){
      textAlign(CORNER);
      textSize(13);
      fill(0);
      text(textShownLokale,lokaleNrX+3,lokaleNrY+(inputBarHeight/2)+4);
    }
    
  }else if(programState ==2){
    //får data fra vores client
    Client thisClient = testServer.available();
    if(thisClient != null){
      println(thisClient.readString());
    }
  }
} 
void mouseClicked(){
  if(isInsideRect(lokaleNrX,lokaleNrY,inputBarWidth,inputBarHeight)){
    lokaleNrPressed = true; 
    maxMenneskerPressed = false; 
  }else if(isInsideRect(lokaleMaxX,lokaleMaxY,inputBarWidth,inputBarHeight)){
    maxMenneskerPressed = true; 
    lokaleNrPressed = false;
  }else if(isInsideRect(width/2-(buttonWidth/2),230-(buttonHeight/2),buttonWidth,buttonHeight)){
    
  }
}
void keyPressed() {
 if(key >= '0' && key <= '9'){
   if(lokaleNrPressed == true){
     lokaleNumberEntered += key;
     println(lokaleNumberEntered);
   }else if(maxMenneskerPressed == true){
     maxMenneskerEntered += key;
   }
 }
}
boolean isInsideRect(int rx, int ry, int w, int h){
  if(mouseX > rx && mouseX < rx+w && mouseY > ry && mouseY < ry+h){
    return true;
  }else{
   return false;
  }
}