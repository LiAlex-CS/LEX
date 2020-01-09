int millisec= 0;
float rotation=0;
float rotationtwo=0;
float rotationthree=0;
float rotationBalance=0;
float rotationEscape=0;
void settings() {
  size(500, 500);
}
void setup() {
  colorMode(HSB, 100);
}
void draw() {

  int is=second();
  int im=minute();
  int ih=hour();
  float m=minute();
  float h=hour();
  if (hour()>12) {
    h=hour()-12;
  }
  float Dyh=250-(sin((h*radians(30))+radians(90 + minute()*0.5))*100);
  float Dxh=250-(cos((h*radians(30))+radians(90 + minute()*0.5))*100);

  float DyHourtoptip=250-(sin((radians(30)*h)+radians(180 + minute()*0.5))*10);
  float DxHourtoptip=250-(cos((radians(30)*h)+radians(180 + minute()*0.5))*10);

  float DyHourbottomtip=250-(sin((radians(30)*h)+radians(360 + minute()*0.5))*10);
  float DxHourbottomtip=250-(cos((radians(30)*h)+radians(360 + minute()*0.5))*10);

  float DyHourbacktip=250-(sin((radians(30)*h)+radians(270 + minute()*0.5))*20);
  float DxHourbacktip=250-(cos((radians(30)*h)+radians(270 + minute()*0.5))*20);

  float Dym=250-(sin((m*radians(6))+radians(90 + second()*0.1))*180);
  float Dxm=250-(cos((m*radians(6))+radians(90 + second()*0.1))*180);

  float DyMinutetoptip=250-(sin((radians(6)*m)+radians(180 + second()*0.1))*10);
  float DxMinutetoptip=250-(cos((radians(6)*m)+radians(180 + second()*0.1))*10);

  float DyMinutebottomtip=250-(sin((radians(6)*m)+radians(360 + second()*0.1))*10);
  float DxMinutebottomtip=250-(cos((radians(6)*m)+radians(360 + second()*0.1))*10);

  float DyMinutebacktip=250-(sin((radians(6)*m)+radians(270 + second()*0.1))*20);
  float DxMinutebacktip=250-(cos((radians(6)*m)+radians(270 + second()*0.1))*20);


  background(0);


  fill(11.95, 43, 89);
  ellipse(250, 250, 440, 440);
  fill(0);
  ellipse(250, 250, 400, 400);



  fill(0);
  textSize(40);
  text(ih, 150, 600);
  text(im, 225, 600);
  text(is, 300, 600);
  text(":", 200, 600);
  text(":", 280, 600);

  stroke(255, 0, 100);
  strokeWeight(1);
  for (float theta=0; theta<=360; theta=theta+6) {
    float linex=250-192*(cos(radians(theta)));
    float liney=250-192*(sin(radians(theta)));
    line(linex, liney, 250, 250);
  }
  noStroke();
  ellipse(250, 250, 350, 350);
  stroke(#e4c77e);
  strokeWeight(3);
  for (float theta=0; theta<=360; theta=theta+30) {
    float linex=250-192*(cos(radians(theta)));
    float liney=250-192*(sin(radians(theta)));
    line(linex, liney, 250, 250);
  }
  noStroke();
  ellipse(250, 250, 300, 300);

  fill(0);
  rect(249.5, 84.5, 43, 55);
  stroke(#e4c77e);
  strokeWeight(2);
  line(228, 57, 238, 57);
  line(241, 57, 271, 57);
  line(228, 112, 238, 112);
  line(241, 112, 271, 112);

  strokeWeight(3);
  line(233, 58, 246, 111);
  line(246, 58, 233, 111);
  line(256, 58, 256, 111);
  line(266, 58, 266, 111);

  fill(255, 0, 100);
  textSize(15);
  text("A L E X   L I", 208, 150);

  pushMatrix();
  translate(250, 250);
  rotation=rotation+0.05;   
  rotate(radians(rotation));
  gear(0, 0, 110);
  popMatrix();

  pushMatrix();
  translate(156, 210);
  rotationtwo=rotationtwo-0.1;
  rotate(radians(rotationtwo));
  gear(0, 0, 75);
  popMatrix();

  pushMatrix();
  translate(300, 200);
  rotationthree=rotationthree-1;
  rotate(radians(rotationthree));
  flatGear(0, 0, 75);
  popMatrix();

  pushMatrix();
  translate(200, 400);
  rotationBalance=rotationBalance+1;
  rotate(radians(90*sin(radians(10*rotationBalance))));
  balanceWheel(0, 0, 75);
  popMatrix();
  
  pushMatrix();
  translate(300, 400);
  rotationEscape=rotationEscape-1;
  rotate(radians(floor(rotationEscape/20)*15));
  escapeWheel(0, 0, 50);
  popMatrix();

  stroke(0);
  fill(#e4c77e);
  strokeWeight(1);
  triangle(Dxh, Dyh, DxHourtoptip, DyHourtoptip, DxHourbacktip, DyHourbacktip);
  triangle(Dxh, Dyh, DxHourbottomtip, DyHourbottomtip, DxHourbacktip, DyHourbacktip);


  triangle(Dxm, Dym, DxMinutetoptip, DyMinutetoptip, DxMinutebacktip, DyMinutebacktip);
  triangle(Dxm, Dym, DxMinutebottomtip, DyMinutebottomtip, DxMinutebacktip, DyMinutebacktip);
}