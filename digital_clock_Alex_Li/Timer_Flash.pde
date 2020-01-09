//This function creates a seperate animation screen for when the timer is finished 

void timerFlash(int fill, int saturation, float brightness, int onTimerFlashSwitch) {
  colorMode(HSB, 100);
  if (onTimerFlashSwitch==1) {
    fill(0);
    rect(0, 0, width, height);
    stroke(fill, saturation, brightness*100);
    strokeWeight(8);
    for (float theta=0; theta<=360; theta=theta+15) {
      float linex=300-250*(cos(radians(theta)));
      float liney=200-100*(sin(radians(theta)));
      line(linex, liney, 300, 200);
    }
    noStroke();
    fill(0);
    ellipse(300, 200, 200, 100);
    textSize(35);
    fill(fill, saturation, brightness*100);
    text("Timer Done", 202, 210);
  }
}