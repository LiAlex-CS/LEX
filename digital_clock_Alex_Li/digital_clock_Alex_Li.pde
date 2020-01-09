//This program requires the Sound library to function
import processing.sound.*;
//This program also requires the soundfile "Buzzer.wav" 
//The soundfile "Buzzer.wav should be in the data folder located in the processing file
SoundFile BUZZER;

int on=0;
int ontwo=0;
int onTimerFlash=0;

void settings() {
  size(600, 600);
}
void setup() {
  background(0);
  //framerate is set to 100 just for the purpose of effeciency 
  frameRate(100);
  
  
}
void draw() {

  int tenmin= (minute())/10; 
  int min= (minute())-tenmin*10;
  int hourp =hour();
  if (hourp > 12) {
    hourp=hourp-12;
  }
  int tenhour=hourp/10;
  int hour = (hourp)-tenhour*10;

  noStroke();
  fill(80, 50, 0);
  rect(0, 0, width, height/1.5);

  strokeWeight(1);
  stroke(1);  
  number(100, 170, tenhour, 1); //tenhour
  number(200, 170, hour, 1); //hour
  number(350, 170, tenmin, 1); //tenmin
  number(450, 170, min, 1); //min
  AMPM(530, 116);

  colon(307, 135);

  button(width/2-150, 500, 80);//Stopwatch
  button(width/2, 500, 80);//Timer 
  button(width/2+150, 500, 80);//Clock
  SWScreen(on);
  timerScreen(ontwo);


  textSize(15);
  fill(69, 100, 100);
  text("Stopwatch", 113, 507);
  text("Timer", 280, 507);
  text("Clock", 430, 507);
   
    if (onTimerFlash==1) {
    timerFlashLight=timerFlashLight+0.0075;
    timerFlash(100, 100, timerFlashLight%2,onTimerFlash);
  }
}
void mousePressed() {

  if (dist(mouseX, mouseY, width/2-150, 500)<=40 && on==0) {
    on=1;
    swswtch=0;
    Time=0;
    ontwo=0;
  } //Stopwatch

  if (dist(mouseX, mouseY, 400, 300)<25 && swset==0 && on==1) {
    colr=100;
    startstop="Stop";
    swset=1;

    swswtch=1;
  }//start&stop start
  else if (swset==1 && dist(mouseX, mouseY, 400, 300)<25 && on==1) {
    colr=27;
    startstop="Start";
    swset=0;
    swswtch=0;
  }//start&stop stop

  if (dist(mouseX, mouseY, 200, 300)<25 && on==1) {
    Time=0;
  } //reset button
  if (dist(mouseX, mouseY, width/2, 500)<=40 && ontwo==0) {
    ontwo=1;
    on=0;
  }//timer screen

  if (dist(mouseX, mouseY, width/2+150, 500)<=40) {
    on=0;
    ontwo=0;
  }//Clock

  if (dist(mouseX, mouseY, 400, 300)<25 && swset==0 && on==0 && ontwo==1) {
    colr=100;
    startstop="Stop";
    swset=1;
    Timerswitch=1;
    swswtch=1;
  }//start&stop  timer start

  else if (swset==1 && dist(mouseX, mouseY, 400, 300)<25 && on==0 && ontwo==1) {
    colr=27;
    startstop="Start";
    swset=0;
    Timerswitch=0;
    swswtch=0;
  }//start&stop Timer stop

  if (dist(mouseX, mouseY, 200, 300)<25 && ontwo==1 ) {
    Timehour=0;
    Timemin=0;
    Timesec=0;
    Minustime=0;
    Timerswitch=0;
    colr=27;
    startstop="Start";
  } //reset button Timer
 
  if (onTimerFlash==1){
    onTimerFlash=0;
    ontwo=1;
    BUZZER.stop();
    
  }  
}



void mouseDragged() {

  if (mouseX<222 && mouseX>114 && mouseY>105 && mouseY<401 && ontwo==1 && Timerswitch==0) {

    Timehour=(mouseY-106)/3;
    Minustime=0;
  }

  if (mouseX<362 && mouseX>253 && mouseY>105 && mouseY<405 && ontwo==1 && Timerswitch==0) {

    Timemin=(mouseY-106)/5;
    Minustime=0;
  }

  if (mouseX<489 && mouseX>394 && mouseY>105 && mouseY<405 && ontwo==1 && Timerswitch==0) {

    Timesec=(mouseY-106)/5;
    Minustime=0;
  }
}