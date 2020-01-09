void button(float buttonx, float buttony, float buttonr) {
  colorMode(HSB, 100);

//if the mouse is hovering over the button, it changes color
  if (dist(mouseX, mouseY, buttonx, buttony) >buttonr/2) {
    stroke(69, 100, 100); 
    fill(50, 50, 90);
    strokeWeight(5); 
    ellipse(buttonx, buttony, buttonr, buttonr);
  } else {
    stroke(50, 100, 100);
    fill(50, 50, 100);
    strokeWeight(5); 
    ellipse(buttonx, buttony, buttonr, buttonr);
  }
}