
float timerFlashLight=0;
int Timehour=0;
int Timemin=0;
int Timesec=0;
int Timerswitch=0;
int Minustime=0;
void timerScreen (int ontwo) {
  colorMode(HSB, 100);
  int Timetwo=Timehour*360000+Timemin*6000+Timesec*100;
  Minustime=Minustime+1*Timerswitch;


  Timetwo = Timetwo - Minustime;



  if (Timetwo==0) {
    Timetwo=0;
    Timerswitch=0;
  }
  int TimehourP= ceil(Timetwo/360000);
  int TimeminP= ceil((Timetwo-TimehourP*360000)/6000);
  int TimesecP = ceil(((Timetwo-TimehourP*360000)-TimeminP*6000)/100);

  if (Timetwo==0) {
    Timehour=0;
    Timemin=0;
    Timesec=0;
    Minustime=0;
  }
  if (ontwo==1) {
    float tmsv=ceil(TimesecP/10);
    float msv= (TimesecP)-tmsv*10;
    float tsv=ceil((TimeminP)/10); 
    float sv=(TimeminP)-tsv*10;
    float tmv=ceil(TimehourP/10);
    float mv=(TimehourP)-tmv*10;

    int tms=ceil(tmsv);
    int ms= ceil(msv);
    int ts=ceil(tsv);
    int s=ceil(sv);
    int tm=ceil(tmv);
    int m=ceil(mv);

    colorMode(HSB, 100);

    noStroke();
    fill(0);
    rect(0, 0, width, height/1.5);

    number(120, 150, tm, 0.6);
    number(180, 150, m, 0.6);
    number(260, 150, ts, 0.6);
    number(320, 150, s, 0.6);
    number(400, 150, tms, 0.6);
    number(460, 150, ms, 0.6);
    startStopButton(400, 300, 50, colr, startstop);
    resetButton(200, 300, 50, "Done");
    noStroke();
    fill(50, 100, 100);
    ellipse(377, 175, 9, 9);
    ellipse(377, 135, 9, 9);
    ellipse(237, 135, 9, 9);
    ellipse(237, 175, 9, 9);
  }
  if (Timetwo==1) {
    onTimerFlash=1;
    BUZZER = new SoundFile(this, "Buzzer.wav");
    BUZZER.play();
  }

}