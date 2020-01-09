

void settings(){size(500,700);
}
void setup(){}
void draw(){

int is=second();
int im=minute();
int ih=hour();
  
float s=second(); 
float as=-90+360*(s/60);

float m=minute();
float am=-90+360*(m/60);

float h=hour();
if(hour()>12){h=hour()-12;}
float ah=-90+360*((h)/12);

float Dyh=250-(sin((h*radians(30))+radians(90))*100);
float Dxh=250-(cos((h*radians(30))+radians(90))*100);

float Dym=250-(sin((m*radians(6))+radians(90))*140);
float Dxm=250-(cos((m*radians(6))+radians(90))*140);

float Dys=250-(sin((radians(6)*s)+radians(90))*180);
float Dxs=250-(cos((radians(6)*s)+radians(90))*180);
background(0);
noFill();
stroke(#493ECB);
strokeWeight(10);
arc(250,250,450,450,radians(-90),radians(as));
stroke(#53F25C);
arc(250,250,425,425,radians(-90),radians(am));
stroke(#FA190D);
arc(250,250,400,400,radians(-90),radians(ah));


textSize(40);
text(ih, 150, 600);
text(im, 225, 600);
text(is, 300, 600);
text(":",200,600);
text(":",280,600);


line(250,250,Dxh,Dyh);
stroke(#53F25C);
line(250,250,Dxm,Dym);
stroke(#493ECB);
line(250,250,Dxs,Dys);
}