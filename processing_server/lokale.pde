// Vores class til lokalerne
class Lokale{
  int lokaleNr;
  int antalMennesker;
  int menneskerMax;
  public int displayX = 100, displayY =40;
  Lokale (int lN, int mM){
    this.lokaleNr = lN;
    this.menneskerMax = mM;
    this.antalMennesker = 0;
  }
  //funktion som viser alt i lokalerne
  void displayLokale(int x, int y){
    if(programState ==1){
      fill(235);
      rectMode(CORNER);
      strokeWeight(1.3);
      rect(x,255+y,displayX,displayY);
      textSize(12);
      fill(0);
      textAlign(CORNER,TOP);
      text("Lokale Nr: "+this.lokaleNr,x+3,255+y+3);
      text("Max Antal: "+this.menneskerMax,x+3,255+y+17);
    }else if(programState == 2){
      fill(235);
      rectMode(CORNER);
      strokeWeight(1.3);
      rect(x,13+y,200,48);
      textSize(12);
      fill(0);
      textAlign(CORNER,TOP);
      text("Lokale Nr: "+this.lokaleNr,x+3,13+y+3);
      text("Personer i lokalet:"+ antalMennesker,x+3,13+y+17);
      fill(0);
      text("Max Antal Personer: "+this.menneskerMax,x+3,13+y+31);
      if(antalMennesker >= menneskerMax){
        strokeWeight(2);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(255,255,0);
        line(x+166,y+56,x+166,y+41);
        stroke(255,221,51);
        line(x+174,y+56,x+174,y+33);
        stroke(255,140,25);
        line(x+182,y+56,x+182,y+25);
        stroke(255,51,0);
        line(x+190,y+56,x+190,y+17);
        stroke(0); 
      }else if(antalMennesker <= 0){
        strokeWeight(2.5);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(0);
      }else if(antalMennesker <= menneskerMax/4){
        strokeWeight(2.5);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(255,255,0);
        line(x+166,y+56,x+166,y+41);
        stroke(0);
      }else if(antalMennesker <= menneskerMax/4*2){
        strokeWeight(2.5);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(255,255,0);
        line(x+166,y+56,x+166,y+41);
        stroke(255,204,0);
        line(x+174,y+56,x+174,y+33);
        stroke(0);
      }else if(antalMennesker <= menneskerMax/4*3){
        strokeWeight(2.5);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(255,255,0);
        line(x+166,y+56,x+166,y+41);
        stroke(255,204,0);
        line(x+174,y+56,x+174,y+33);
        stroke(0);
      }else if(antalMennesker < menneskerMax){
        strokeWeight(2);
        stroke(128,255,0);
        line(x+158,y+56,x+158,y+49);
        stroke(255,255,0);
        line(x+166,y+56,x+166,y+41);
        stroke(255,221,51);
        line(x+174,y+56,x+174,y+33);
        stroke(255,140,25);
        line(x+182,y+56,x+182,y+25);
        stroke(0);
      }
    }
  }
  void lokaleMennesker(int m){
    antalMennesker = m;
  }
}