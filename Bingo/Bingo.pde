/*
Description: The objective of this program is able to generate one or multiple random 
 bingo card templates in either decimal, binary,hexadecimal, and octal.
 The program should also be able to switch a "free space"   
 
 Creators: Alex, Raaghav
 
 Date Last Modified: 2018-01-08
 
 */

// uses processing pdf library
import processing.pdf.*;
// delcares all intlists containing all values that are used in the generator
IntList fifteen; //1-15 decimal
IntList thirty; //16-30 decimal
IntList fourtyFive; //31-45 decimal
IntList sixty; //46-60 decimal
IntList seventyFive; //61-75 decimal
IntList tenBi; //1-10 binary 
IntList twentyBi; //11-20 binary 
IntList thirtyBi; //21-30 binary 
IntList fourtyBi; //31-40 binary 
IntList fiftyBi; //41-50 binary 
IntList fiftHex; //1-50 hex
IntList oneHunHex; //51-100 hex
IntList oneFiftHex; //101-150 hex
IntList twoHunHex; //151-200 hex
IntList twoFiftHex; //201-250 hex
IntList thrOct; //1-30 octal
IntList sixOct; //31-60 octal
IntList ninOct; //61-90 octal
IntList oneTwOct; //91-120 octal
IntList oneFiOct; //121-150 octal
// declares the number of additional templates
int numberTemplates=0;
//declares the size of the template
int templateSize=34;
// the int number is used to regulate the number of screenshots taken
int number=99999;
//declares free spot switch 
boolean freeSwitch=false;
//declares screenshot switch
boolean record;
//mode describes what computer language is used(i.e binary, decimal, hex...) 
int mode=0;
//declares the color of the template 
color colr=#000000;
//used for the input of the number of screenshots
String input = new String("");
void settings() {
}
void setup() {
  colorMode(RGB, 360);
  //sets up second screen used for settings
  String[] args = {"Settings"};
  Settings sa = new Settings();
  PApplet.runSketch(args, sa);
  //sets up inlists for decimal mode 
  fifteen= new IntList();
  thirty= new IntList();
  fourtyFive= new IntList();
  sixty= new IntList();
  seventyFive= new IntList();
  //gives values for each number in the intlist for the decimal mode  
  for (int i=1; i<=15; i++) {
    fifteen.append(i);
  }
  for (int i=16; i<=30; i++) {
    thirty.append(i);
  }
  for (int i=31; i<=45; i++) {
    fourtyFive.append(i);
  }
  for (int i=46; i<=60; i++) {
    sixty.append(i);
  }
  for (int i=61; i<=75; i++) {
    seventyFive.append(i);
  }
  //shuffles each value to an intial random number
  fifteen.shuffle();
  thirty.shuffle();
  fourtyFive.shuffle();
  sixty.shuffle();
  seventyFive.shuffle();

  //sets up inlists for binary mode  
  tenBi= new IntList();
  twentyBi= new IntList();
  thirtyBi= new IntList();
  fourtyBi= new IntList();
  fiftyBi= new IntList();

  //gives values for each number in the intlist for the binary mode
  for (int i=1; i<=10; i++) {
    tenBi.append(i);
  }
  for (int i=11; i<=20; i++) {
    twentyBi.append(i);
  }
  for (int i=21; i<=30; i++) {
    thirtyBi.append(i);
  }
  for (int i=31; i<=40; i++) {
    fourtyBi.append(i);
  }
  for (int i=41; i<=50; i++) {
    fiftyBi.append(i);
  }

  //shuffles each value to an intial random number
  tenBi.shuffle();
  twentyBi.shuffle();
  thirtyBi.shuffle();
  fourtyBi.shuffle();
  fiftyBi.shuffle();

  //sets up inlists for hex mode  
  fiftHex= new IntList();
  oneHunHex= new IntList();
  oneFiftHex= new IntList();
  twoHunHex= new IntList();
  twoFiftHex= new IntList();

  //gives values for each number in the intlist for the hex mode
  for (int i=1; i<=50; i++) {
    fiftHex.append(i);
  }
  for (int i=51; i<=100; i++) {
    oneHunHex.append(i);
  }
  for (int i=101; i<=150; i++) {
    oneFiftHex.append(i);
  }
  for (int i=151; i<=200; i++) {
    twoHunHex.append(i);
  }
  for (int i=201; i<=250; i++) {
    twoFiftHex.append(i);
  }
  //shuffles each value to an intial random number
  fiftHex.shuffle();
  oneHunHex.shuffle();
  oneFiftHex.shuffle();
  twoHunHex.shuffle();
  twoFiftHex.shuffle();

  //sets up inlists for octal mode 
  thrOct= new IntList();
  sixOct= new IntList();
  ninOct= new IntList();
  oneTwOct= new IntList();
  oneFiOct= new IntList();

  //gives values for each number in the intlist for the octal mode
  for (int i=1; i<=30; i++) {
    thrOct.append(i);
  }
  for (int i=31; i<=60; i++) {
    sixOct.append(i);
  }
  for (int i=61; i<=90; i++) {
    ninOct.append(i);
  }
  for (int i=91; i<=120; i++) {
    oneTwOct.append(i);
  }
  for (int i=121; i<=150; i++) {
    oneFiOct.append(i);
  }

  //shuffles each value to an intial random number
  thrOct.shuffle();
  sixOct.shuffle();
  ninOct.shuffle();
  oneTwOct.shuffle();
  oneFiOct.shuffle();
}
void draw() {
  //sets screen size depending on number of templates on screen 
  if (numberTemplates<=2 && floor(numberTemplates/3+1)<4) {
    surface.setSize((numberTemplates+1)*(templateSize*5+10)+10, (templateSize+10)*5);
  } else if (numberTemplates>2 && floor(numberTemplates/3+1)<4) {
    surface.setSize(3*(templateSize*5+10)+10, ((templateSize+10)*5)+((templateSize+10)*5)*floor((numberTemplates)/3));
  } else {
    surface.setSize(3*(templateSize*5+10)+10, (templateSize+10)*20);
  }

  //turns the input value of number of screenshots to a vlaue 
  int numPrints=int(input);
  // recording
  number=number+1;
  if (number<=numPrints) {
    beginRecord(PDF, "BINGO Template-####.pdf");
  }

  background(360, 360, 360);
  noStroke();
  fill(0);



  // organizing positioning of templates depending on template size and number of additional templates 
  for (float i=10; i<=10+(5*templateSize+10)*(numberTemplates); i=i+5*(templateSize)+10) {
    bingoCardTemplate(i, templateSize, templateSize, colr, mode);
    if (i>2*5*templateSize+10) {
      bingoCardTemplate(i-(3*5*templateSize+30), (templateSize*1.2)*5+templateSize, templateSize, colr, mode);
    }
    if (i>3*5*templateSize+10) {
      bingoCardTemplate(i-(6*5*templateSize+60), (templateSize*1.2)*10+templateSize, templateSize, colr, mode);
    }
    if (i>3*5*templateSize+10) {
      bingoCardTemplate(i-(9*5*templateSize+90), (templateSize*1.2)*15+templateSize, templateSize, colr, mode);
    }
  }
  // recording
  if ( number<=numPrints) {
    endRecord();
    record=false;
  }
}

//second screen
public class Settings extends PApplet {
  public void settings() {
    size(500, 300);
  }
  public void setup() {
    colorMode(RGB, 360);
    background(360);
  }
  public void draw() {
    fill(0);
    textSize(25);  
    noFill();

    fill(360, 360, 360);
    noStroke();
    rect(0, 0, width, height);
    stroke(1);
    rect(20, 40, 460, 160);


    rect(100, 270, 50, 20);//number +
    rect(20, 270, 50, 20);//-
    rect(300, 270, 50, 20);//size +
    rect(220, 270, 50, 20);//-
    rect(375, 250, 110, 40); // generate 
    fill(0);
    text("Settings", 40, 30);
    textSize(20);
    text("Mode:", 35, 85);
    fill(360);
    rect(105, 65, 50, 20); //decimal
    rect(175, 65, 50, 20); //binary
    rect(245, 65, 50, 20); //hex
    rect(315, 65, 50, 20); //octal
    fill(0);
    text("FREE:", 43, 125);
    fill(360);
    rect(105, 105, 50, 20); //on
    rect(175, 105, 50, 20); //off
    fill(0);
    text("Color:", 36, 165);
    fill(360);
    rect(105, 145, 50, 20); //black
    rect(175, 145, 50, 20); //red
    rect(245, 145, 50, 20); //blue
    rect(315, 145, 50, 20); //green
    rect(385, 145, 50, 20); //yellow
    fill(0);
    text("Number of Copies:", 36, 225);
    textSize(15); 
    text("Number of Templates", 13, 255);
    text("Size", 270, 255);
    text(numberTemplates+1, 80, 285);
    textSize(12);
    text(round(templateSize*2.9412)+"%", 270, 285);
    text("+", 121.5, 284);
    text("-", 44, 284);
    text("+", 320.5, 284);
    text("-", 243, 284);
    text("Decimal", 107, 80);
    text("Binary", 182, 80);
    text("Hex", 260, 80);
    text("Octal", 325, 80);
    text("ON", 121, 120);
    text("OFF", 190, 120);
    text("Black", 115, 160);
    text("Red", 190, 160);
    text("Blue", 259, 160);
    text("Green", 323, 160);
    text("Orange", 389, 160);
    fill(200);
    text("Type Number of Copies", 230, 223);
    if (int(input)>0) {
      fill(360);
      noStroke();
      rect(230, 202, 150, 30);
      stroke(1);
    }
    fill(0);
    textSize(20);
    text("GENERATE", 379, 278);
    text(input, 220, 225);
  }
  public void mouseClicked() {
    if (mouseX>100 && mouseX<150 && mouseY>270 && mouseY<290 && numberTemplates<11) { //add template
      numberTemplates=numberTemplates+1;
    }
    if (mouseX>20 && mouseX<70 && mouseY>270 && mouseY<290 && numberTemplates>=1) { //subtract 
      numberTemplates=numberTemplates-1;
    }
    if (mouseX>300 && mouseX<350 && mouseY>270 && mouseY<290 && templateSize<49) { //add size
      templateSize=templateSize+3;
    }
    if (mouseX>220 && mouseX<270 && mouseY>270 && mouseY<290 && templateSize>22) { //subtract size
      templateSize=templateSize-3;
    }
    if (mouseX>375 && mouseX<485 && mouseY>250 && mouseY<290) { //generate
      number=0;
    }
    if (mouseX>105 && mouseX<155 && mouseY>65 && mouseY<85) { //deicmal
      mode=0;
    }
    if (mouseX>175 && mouseX<225 && mouseY>65 && mouseY<85) { //binary
      mode=1;
    }
    if (mouseX>245 && mouseX<295 && mouseY>65 && mouseY<85) { //hex
      mode=2;
    }
    if (mouseX>315 && mouseX<365 && mouseY>65 && mouseY<85) { //octal
      mode=3;
    }
    if (mouseX>105 && mouseX<155 && mouseY>105 && mouseY<125) { //free
      freeSwitch=true;
    }
    if (mouseX>175 && mouseX<225 && mouseY>105 && mouseY<125) { //free
      freeSwitch=false;
    }
    if (mouseX>105 && mouseX<155 && mouseY>145 && mouseY<165) { //black
      colr=#000000;
    }
    if (mouseX>175 && mouseX<225 && mouseY>145 && mouseY<165) { //red
      colr=#FF0000;
    }
    if (mouseX>245 && mouseX<295 && mouseY>145 && mouseY<165) { //blue
      colr=#2500FF;
    }
    if (mouseX>315 && mouseX<365 && mouseY>145 && mouseY<165) { //green
      colr=#00FF1B;
    }
    if (mouseX>385 && mouseX<435 && mouseY>145 && mouseY<165) { //orange 
      colr=#FFA600;
    }
  }
  public void keyTyped() {
    if (key >= '0' && key <= '9') { //number of copies input
      input = input + key;
    }
    //backspace function 
    if (key==BACKSPACE)
      input= input.substring(0, max(0, input.length()-1));
  }
}