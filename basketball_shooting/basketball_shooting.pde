/*
Description: The objective of this program is able to simulate a basketball shooting game. The objective of the 
game is to score as many hoops as possible within the time restraints
 
 Creator: Alex Li
 
 Date Last Modified: 2018-01-19
 
 */

//declares the possible positions of the backboard
IntList backboardPositions;
IntList backboardLogic;
//delcares gravatational acceleration of the ball
float acceleration=9.8;
//declares time of the ball 
float time;
//declares initial velocity of the ball
float initialVelocity;
//declares points scored 
int points;
//declares direction of the moving backboard 
int direction=1;
//declares timer limit(60 seconds) of game and the switch, starting and stopping the timer
int timer=10800;
int timerSwitch;
//declares the firework balls and the limit of the firework timer
int fireworkBalls=100;
int fireworkTime=301;
//declares angle of trajectory of the ball
float angle=0;
//declares x,y,z positions of ball
float deltaDy;
float deltaDx;
float deltaDz;
//declares the position of the backboard
float backboardX;
//declares the changing position of the backboard
float backboardXChange;
//declares the initial vertical and horizontal positions and velocites of each firework particle 
float fireworksDeltaX[]=new float[fireworkBalls];
float fireworksX[]=new float[fireworkBalls];
float fireworksDeltaY[]=new float[fireworkBalls];
float fireworksY[]=new float[fireworkBalls];
//declares the switches of the start, play, and end screen
boolean startScreen=true;
boolean playScreen=false;
boolean endScreen=false;
// declares the neutral, aiming, and shooting modes of the ball
boolean neutral=true;
boolean aiming =false;
boolean shooting=false;
// delcares the image of the title screen
PImage titleScreen;
//declares image of basketball
PImage basketball;

void settings() {
  fullScreen();
}
void setup() {
  //sets up the randompositions for the backboard and net
  backboardLogic= new IntList();
  for (int i=130; i<width-130; i=i+1) {
    backboardLogic.append(i);
  }
  backboardLogic.shuffle();
  backboardPositions= new IntList();
  backboardPositions.append(width/2);
  for (int i=0; i<240; i=i+1) {
    backboardPositions.append(backboardLogic.get(i));
  }
  //image used in starting screen
  titleScreen= loadImage("startScreen.png");
  //image used for ball in play screen
  basketball= loadImage("basketball.png");

  //settings positions and speeds for fireworks when scored 
  for (int i=0; i<fireworksDeltaX.length; i++) {
    fireworksDeltaX[i]=(random(-3, 3));
    fireworksDeltaY[i]=(random(-3, 3));
    fireworksX[i]=width/2;
    fireworksY[i]=height/3;
  }
  imageMode(CENTER);
  frameRate(180);
}
void draw() {
  //setting up 60 second timer during game 
  timer=timer-1*timerSwitch;
  int timerSeconds=int(timer/180);
  int tenDigitSeconds=floor(timerSeconds/10);
  int oneDigitSeconds=timerSeconds-tenDigitSeconds*10;
  // START SCREEN FOR GAME 
  if (playScreen==false && startScreen==true && endScreen==false) {    
    background(112, 146, 190);
    image(titleScreen, width/2, height/2);
    stroke(1);
    //rect((width/2)-125, height-150, 250, 120);
    textSize(20);
    text("Game By: Alex Li", width/2-300, height/3);
    text("Cover Art By: Neil Medha", width/2, height/3);
    textSize(50);
    if (second()%2==0) {
      text("PRESS SPACE TO PLAY ", width/3.3, (height/6)*5);
    }
  }
  // GAME SCREEN FOR GAME 

  if (playScreen==true && startScreen==false && endScreen==false) {
    //background picture
    background(#C6AF62);
    fill(#FFCA43);
    rect(0, (height/3)*2, width, height-(height/3)*2);    
    for (int i=0; i<width; i=i+32) {
      for (float s=(height/3)*1.3; s<470; s=s+34) {
        fill(#FF2D1A);
        stroke(#D81C0B);
        strokeWeight(2);
        rect(i, s, 30, 35);
        stroke(1);
        strokeWeight(1);
      }
    }
    fill(#EAEAEA);
    rect(0, (height/3)*1.8, width, 100);
    //setting fireworks 
    fireworkTime=fireworkTime+1; 
    //SCOREBOARD VISUALS
    fill(20);
    rect(width/2-150, 5, 300, 150);
    fill(255);
    int tenDigitPoints=floor(points/10);
    int oneDigitPoints=points-tenDigitPoints*10;
    number(width/2-25, height/6, tenDigitPoints, 0.3);
    number(width/2+5, height/6, oneDigitPoints, 0.3);
    textSize(15);
    fill(255);
    text("POINTS", width/2-28, height/7-10);
    text("TIME", width/2.06, height/25);
    number(width/2-25, height/7-50, tenDigitSeconds, 0.3);
    number(width/2+5, height/7-50, oneDigitSeconds, 0.3);

    //NET
    //sets positions of net and backboard 
    //visuals for backboard and net in the condition the ball is behind of backboard and net *the code for the backboard and net is written twice to prevent flashing visual bug
    backboardX=backboardPositions.get(points)+backboardXChange;
    if (deltaDz<19 && points<=2) {
      backboardNet(backboardPositions.get(points), 250);
    }
    if (deltaDz<20 && points>2) {
      //changes the direction of the basketball net based off its position 
      if (backboardX>(width-250/2)) {
        direction=-1;
      }
      if (backboardX<(250/2)) {
        direction=1;
      }
      backboardXChange=backboardXChange+0.7*direction;
      backboardNet(backboardPositions.get(points)+backboardXChange, 250);
    }
    backboardNet(backboardPositions.get(points)+backboardXChange, 250);
    //visuals for front of rim. *the code for the front rim is written twice to prevent flashing visual bug
    noStroke();
    fill(#FF7003);
    rect(backboardX-40, 295, 80, 10);
    ellipse(backboardX+40, 300, 10, 10);
    ellipse(backboardX-40, 300, 10, 10);
    fill(255);
    stroke(1);
    //visuals for front of rim in the condition the ball is infront of rim
    if (deltaDz<11.2) {
      noStroke();
      fill(#FF7003);
      rect(backboardX-40, 295, 80, 10);
      ellipse(backboardX+40, 300, 10, 10);
      ellipse(backboardX-40, 300, 10, 10);
      fill(255);
      stroke(1);
    }
    //BALL MECHANICS 
    //neutral mode, where the ball remains at rest with no aiming acting on it
    if (shooting==false) {
      image(basketball, width/2, (height*3)/4, 60, 60);
    }
    // aiming mode, where the ball remains at rest with the user aiming. Displays aiming visual mechanics  
    if (aiming ==true) {
      ellipse(mouseX, mouseY, 10, 10);
      line(width/2, (height*3)/4, mouseX, mouseY);
    }
    //shooting mode, where the ball moves with with no aiming acting on it
    if (shooting==true ) {
      //sets up the x,y,z positions of the ball as it moves dependent on the initial velocity and angle
      //sets up the balls time 
      time=time+0.07;
      deltaDx=initialVelocity*cos(radians(angle))*time+width/2;
      deltaDy=0.5*(acceleration)*pow((time), 2)-initialVelocity*sin(radians(angle))*time+(height*3)/4;
      deltaDz=time;
      image(basketball, deltaDx, deltaDy, pow(deltaDz, -0.10)*60, pow(deltaDz, -0.10)*60);
    }
    //sets the return function for the ball when its y position is below a certain point 
    if (deltaDy>(height*3)/4 && shooting==true) {
      neutral=true;
      aiming=false;
      shooting=false;
      deltaDy=0;
      deltaDx=0;
      deltaDz=0;
      time=0;
    }
    //visuals for backboard and net in the condition the ball is behind of backboard and net
    if (deltaDz>20 && points<=2) {
      backboardNet(backboardPositions.get(points), 250);
    }
    if (deltaDz>20 && points>2) {
      if (backboardX>(width-250/2)) {
        direction=-1;
      }
      if (backboardX<(250/2)) {
        direction=1;
      }
      backboardXChange=backboardXChange+1*direction;
      backboardNet(backboardPositions.get(points)+backboardXChange, 250);
    }
    //sets up the outer rim of the basketball rim, able to differentiate if the ball is infront of rim or behind based off of the z position of the ball
    //visuals for front of rim in the condition the ball is behind of rim
    if (deltaDz>11.2) {
      noStroke();
      fill(#FF7003);
      rect(backboardX-40, 295, 80, 10);
      ellipse(backboardX+40, 300, 10, 10);
      ellipse(backboardX-40, 300, 10, 10);
      fill(255);
      stroke(1);
    }
    //POINTS
    //if ball is in specific x,y,z parameters, adds addition point and displays fireworks 
    if (deltaDx<backboardPositions.get(points)+backboardXChange+25 && deltaDx>backboardPositions.get(points)+backboardXChange-25 && deltaDz<19 && deltaDz>11.2 && deltaDy>300 && deltaDy<308) {
      points=points+1;
      backboardXChange=0;
      direction=int (random(1, -1));
      fireworkTime=0;
    }
    //FIREWORKS
    //sets fireworks visuals bassed off time limit 
    if (fireworkTime<300) {
      for (int i=0; i<fireworksX.length; i++) {

        fireworksX[i]=fireworksX[i]+fireworksDeltaX[i];
        fireworksY[i]=fireworksY[i]+fireworksDeltaY[i];
        fill(i, 300-i*2, i, 300-fireworkTime*2);
        noStroke();
        ellipse(fireworksX[i], fireworksY[i], 5, 5);
        stroke(1);
      }
    }
    if (fireworkTime>300) {
      for (int i=0; i<fireworksX.length; i++) {
        fireworksX[i]=width/2;
        fireworksY[i]=height/3;
      }
    }

    fill(255);
  }
  //ENDSCREEN
  //resets all parameters when game ends 
  if (timer<=0) {
    endScreen=true;
    playScreen=false;
    startScreen=false;
    timerSwitch=0;
    timer=10800;
    deltaDy=0;
    deltaDx=0;
    deltaDz=0;
    time=0;
    backboardXChange=0;
    neutral=true;
    shooting=false;
    aiming=false;
  }
  if (endScreen==true && playScreen==false && startScreen==false) {
    background(112, 146, 190);
    fill(255);
    textSize(100);
    text("GAME OVER", width/2-300, height/2);
    textSize(30);
    text("PRESS SPACE TO PLAY AGAIN", width/4-200, (height/4)*3);
   text("PRESS ESC TO EXIT", width/1.6, (height/4)*3);
  }
}
void mousePressed() {
  //mouse mechanics during aiming 
  if (dist(mouseX, mouseY, width/2, (height*3)/4)<=25 && neutral==true) {
    aiming =true;
    neutral=false;
    shooting=false;
  }
}
void mouseReleased() {
  //mouse mechanics during shooting 
  if (aiming==true && neutral==false && shooting==false) { 
    aiming =false;
    shooting=true;
    neutral=false;
  }
  //determining angle and velocity based off of mouseX, mouseY relative to the ball
  if (mouseX<width/2) {
    angle=degrees(atan2((mouseY-(height*3)/4), (width/2-mouseX)));
  } else if (mouseX>width/2) {
    angle=180-degrees(atan2((mouseY-(height*3)/4), (mouseX-width/2)));
  } else if (mouseX==width/2) {
    angle=90;
  }
  initialVelocity= dist(mouseX, mouseY, width/2, (height*3)/4)/1.3 ;
}
void keyPressed() {
  //initial starting button to play
  if (keyCode== ' '  && playScreen==false && startScreen==true && endScreen==false) {
    playScreen=true;
    startScreen=false;
    endScreen=false;
    timerSwitch=1;
  }
  //relay button to play
  //resent parameters for a new game
  if (keyCode== ' ' && playScreen==false && startScreen==false && endScreen==true) {
    playScreen=true;
    startScreen=false;
    endScreen=false;
    timerSwitch=1;
    points=0;
  }
}