// int colr is the variable that determins whether the color of the startStopButton is green or red  
int colr=27;
// String startstop is the variable that determins whether the text of the startStopBottom is "Start" or "Stop"
String startstop= "Start";
int swset=0;

int Time=0;
int swmillis=0;
int swsec=0;
int swmin=0;
int swswtch=1;
void SWScreen(int on) {



  Time=Time+1*swswtch;  
  swmillis=Time-100*(Time/100);
  swsec= (Time/100)-60*(Time/6000);
  swmin= (Time/6000)-99*(Time/360000);


  int tms=swmillis/10;
  int ms= (swmillis)-tms*10;
  int ts=(swsec)/10;
  int s=(swsec)-ts*10;
  int tm=swmin/10;
  int m=(swmin)-tm*10;
  if (on==1) {
    colorMode(HSB, 100);

    noStroke();
    fill(0);
    rect(0, 0, width*on, height/2);
    fill(50, 100, 100);
    ellipse(377, 195, 9, 9);
    ellipse(237, 135, 9, 9);
    ellipse(237, 175, 9, 9);
    number(120, 150, tm, 0.6);
    number(180, 150, m, 0.6);
    number(260, 150, ts, 0.6);
    number(320, 150, s, 0.6);
    number(400, 150, tms, 0.6);
    number(460, 150, ms, 0.6);

    startStopButton(400, 300, 50, colr, startstop);
    resetButton(200, 300, 50, "Reset");
  }
}