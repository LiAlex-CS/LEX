
void startStopButton(float swbuttonx, float swbuttony, float swbuttonr, float swbuttonh, String swtext) {

  colorMode(HSB);
  if (dist(mouseX, mouseY, swbuttonx, swbuttony) >swbuttonr/2) {
    fill(swbuttonh, 100, 100);
    stroke(swbuttonh+10, 100, 70);
    strokeWeight(3);
    ellipse(swbuttonx, swbuttony, swbuttonr, swbuttonr);
    fill(swbuttonh+10, 100, 70);
    text(swtext, swbuttonx-22, swbuttony+10);
  } else {
    stroke(swbuttonh+20, 70, 80);
    fill(swbuttonh, 50, 100);
    strokeWeight(5); 
    ellipse(swbuttonx, swbuttony, swbuttonr, swbuttonr);
    fill(swbuttonh+20, 80, 80);
    text(swtext, swbuttonx-22, swbuttony+10);
  }
}