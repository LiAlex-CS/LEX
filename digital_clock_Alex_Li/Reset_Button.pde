void resetButton(float rbuttonx, float rbuttony, float rbuttonr, String rbuttont) {
  colorMode(HSB, 100);
  if (dist(mouseX, mouseY, rbuttonx, rbuttony) >rbuttonr/2) {
    textSize(15);
    strokeWeight(3);
    stroke(69, 100, 100);
    fill(50, 50, 90);
    ellipse(rbuttonx, rbuttony, rbuttonr, rbuttonr);
    fill(69, 100, 100);
    text(rbuttont, rbuttonx-19, rbuttony+6);
  } else {
    textSize(15);
    strokeWeight(5);
    stroke(50, 100, 100);
    fill(50, 50, 100);
    ellipse(rbuttonx, rbuttony, rbuttonr, rbuttonr);
    fill(69, 100, 100);
    text(rbuttont, rbuttonx-19, rbuttony+6);
  }
}