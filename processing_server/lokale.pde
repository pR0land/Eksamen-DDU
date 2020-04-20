class Lokale{
  int lokaleNr;
  int antalMennesker;
  color lokaleFarve;
  int menneskerMax;
  public int displayX = 100, displayY =40;
  Lokale (int lN, int mM){
    this.lokaleNr = lN;
    this.menneskerMax = mM;
    this.antalMennesker= 0;
    this.lokaleFarve = color(0,255,0);
  }
  void skiftLokaleFarve(){
    if(antalMennesker <= menneskerMax/3){
      this.lokaleFarve = color(255,221,51);
    }else if(antalMennesker <= menneskerMax/3*2){
      this.lokaleFarve = color(255,140,25);
    }else if(antalMennesker >= menneskerMax){
      this.lokaleFarve = color(255,0,0);
    }else if(antalMennesker == 0){
      this.lokaleFarve = color(0,255,0);
    }else{
      println("fejl lokale Nr:" +this.lokaleNr);
      this.lokaleFarve = color(0,0,255);
    }
  }
  void displayLokale(int x, int y){
    if(programState ==1){
      fill(255);
      rectMode(CORNER);
      strokeWeight(1.3);
      rect(x,255+y,displayX,displayY);
      textSize(12);
      fill(0);
      textAlign(CORNER,TOP);
      text("Lokale Nr: "+this.lokaleNr,x+3,255+y+3);
      text("Max Antal: "+this.menneskerMax,x+3,255+y+17);
    }else if(programState == 2){
      fill(255);
      rectMode(CORNER);
      strokeWeight(1.3);
      rect(x,13+y,240,48);
      textSize(12);
      fill(0);
      textAlign(CORNER,TOP);
      text("Lokale Nr: "+this.lokaleNr,x+3,13+y+3);
      text("Personer i lokalet:",x+3,13+y+17);
      fill(this.lokaleFarve);
      text(this.antalMennesker,x+3+108,13+y+17);
      fill(0);
      text("Max Antal Personer: "+this.menneskerMax,x+3,13+y+31);
    }
  }
}