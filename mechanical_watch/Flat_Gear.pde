void flatGear(float gearx, float geary, float gearRadius ) {
  rectMode(CENTER);
  fill(34);
  strokeWeight(6);
  stroke(34);
  ellipse(gearx, geary, gearRadius, gearRadius);
  fill(0);
  ellipse(gearx, geary, gearRadius/5, gearRadius/5);
  for (float theta=0; theta<=360; theta=theta+6) {
    for (float thetap=0; thetap<=360; thetap=thetap+6) {
      float linex=gearx-(gearRadius/2 + (gearRadius/2)*0.15)*(cos(radians(theta)));
      float liney=geary-(gearRadius/2 + (gearRadius/2)*0.15)*(sin(radians(theta)));
      float linexp=gearx-(gearRadius/2)*(cos(radians(thetap)));
      float lineyp=geary-(gearRadius/2)*(sin(radians(thetap)));
      if (theta==thetap) {
        strokeWeight(gearRadius/30);
        stroke(34);
        line(linex, liney, linexp, lineyp);
      }
    }
  }
  noStroke();
}