import processing.net.*;
int programState =1;
ArrayList<Lokale> lokaler;
Server testServer;

void setup(){
 size(600,600);
 testServer = new Server(this,7000);
 println(Server.ip());
}
void draw(){
  if(programState ==1){
    background(255);
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("SETUP",width/2,50);
  }else if(programState ==2){
    //får data fra vores client
    Client thisClient = testServer.available();
    if(thisClient != null){
      println(thisClient.readString());
    }
  }
} 
