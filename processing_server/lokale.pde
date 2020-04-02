class Lokale{
  int lokaleNr;
  int antalMennesker;
  color lokaleFarve;
  int menneskerMax;
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
}
