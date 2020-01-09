//This function draws a number out of rectangles in a digital format 

void number(float rectmx, float rectmy, int time, float size) {
  colorMode(HSB, 100);
  //int t refers to the color of top rectangle
  int t=0;
  //int tr refers to the color of top right rectangle
  int tr=0;
  //int tl refers to the color of top leftrectangle
  int tl=0;
  //int m refers to the color of middle rectangle
  int m=0;
  //int br refers to the color of bottom right rectangle
  int br=0;
  //int bl refers to the color of bottom left rectangle
  int bl=0;
  //int b refers to the color of bottom rectangle
  int b=0;


  //int tb refers to the brightness of top rectangle
  int tb=0;
  //int trb refers to the brightness of top right rectangle
  int trb=0;
  //int tlb refers to the brightness of top left rectangle
  int tlb=0;
  //int mb refers to the brightness of middle rectangle
  int mb=0;
  //int brb refers to the brightness of bottom right rectangle
  int brb=0;
  //int blb refers to the brightness of bottom left rectangle
  int blb=0;
  //int bb refers to the brightness of bottom rectangle
  int bb=0;

  //Each number ranging from 0-9 have their own combination of which rectangles are colored and which are not to visualize the number 
  if (time==0) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=50;
    tlb=300;
    m=0;
    br=50;
    brb=300;
    bl=50;
    blb=300;
    b=50;
    bb=300;
  } else if (time==1) {
    t=0;
    tr=50;
    trb=300;
    tl=0;
    m=0;
    br=50;
    brb=300;
    bl=0;
    b=0;
  } else if (time==2) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=0;
    m=50;
    mb=300;
    br=0;
    bl=50;
    blb=300;
    b=50;
    bb=300;
  } else if (time==3) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=0;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=0;
    b=50;  
    bb=300;
  } else if (time==4) {
    t=0;
    tr=50;
    trb=300;
    tl=50;
    tlb=300;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=0;
    b=0;
  } else if (time==5) {
    t=50;
    tb=300;
    tr=0;
    tl=50;
    tlb=300;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=0;
    b=50;
    bb=300;
  } else if (time==6) {
    t=50;
    tb=300;
    tr=0;
    tl=50;
    tlb=300;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=50;
    blb=300;
    b=50;
    bb=300;
  } else if (time==7) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=0;
    m=0;
    br=50;
    brb=300;
    bl=0;
    b=0;
  } else if (time==8) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=50;
    tlb=300;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=50;
    blb=300;
    b=50;
    bb=300;
  } else if (time==9) {
    t=50;
    tb=300;
    tr=50;
    trb=300;
    tl=50;
    tlb=300;
    m=50;
    mb=300;
    br=50;
    brb=300;
    bl=0;
    b=0;
  }

  fill(t, 300, tb);
  rect(rectmx, rectmy-70*size, 60*size, 10*size, 25);//rectTop 
  fill(tl, 300, tlb);
  rect(rectmx-10*size, rectmy-60*size, 10*size, 60*size, 25);//rectTopleft
  fill(tr, 300, trb);
  rect(rectmx+60*size, rectmy-60*size, 10*size, 60*size, 25);//rectTopRight
  fill(m, 300, mb);
  rect(rectmx, rectmy, 60*size, 10*size, 25);//rectMiddle
  fill(bl, 300, blb);
  rect(rectmx-10*size, rectmy+10*size, 10*size, 60*size, 25);//rectBottomRight
  fill(br, 300, brb);
  rect(rectmx+60*size, rectmy+10*size, 10*size, 60*size, 25);//rectBottomLeft
  fill(b, 300, bb);
  rect(rectmx, rectmy+70*size, 60*size, 10*size, 25);//rectBottom
}