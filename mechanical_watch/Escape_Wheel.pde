void escapeWheel(float gearx, float geary, float gearRadius ) {
  rectMode(CENTER);
  noFill();
  strokeWeight(3);
  stroke(34);
  ellipse(gearx, geary, gearRadius, gearRadius);
  strokeWeight(6);
  ellipse(gearx, geary, gearRadius/7, gearRadius/7);
for (float theta=0; theta<=360; theta=theta+90) {
    for (float thetap=0; thetap<=360; thetap=thetap+90) {
      float linex=gearx-(gearRadius/8.5)*(cos(radians(theta)));
      float liney=geary-(gearRadius/8.5)*(sin(radians(theta)));
      float linexp=gearx-(gearRadius/2)*(cos(radians(thetap)));
      float lineyp=geary-(gearRadius/2)*(sin(radians(thetap)));
      if (theta==thetap) {
        strokeWeight(gearRadius/20);
        stroke(34);
        line(linex, liney, linexp, lineyp);
      }
    }
  }
  for (float theta=0; theta<=360; theta=theta+24) {
    for (float thetap=0; thetap<=360; thetap=thetap+24) {
      float linex=gearx-(gearRadius/2 + (gearRadius/2)*0.25)*(cos(radians(theta)));
      float liney=geary-(gearRadius/2 + (gearRadius/2)*0.25)*(sin(radians(theta)));
      float linexp=gearx-(gearRadius/2)*(cos(radians(thetap)));
      float lineyp=geary-(gearRadius/2)*(sin(radians(thetap)));
      if (theta+24==thetap) {
        strokeWeight(gearRadius/20);
        stroke(34);
        line(linex, liney, linexp, lineyp);
      }
    }
  }
  noStroke();
}