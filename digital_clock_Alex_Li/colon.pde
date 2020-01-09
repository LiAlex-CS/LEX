void colon(float colonx, float colony) {
  colorMode(HSB, 100);
  int b=0;
  if (second()%2==0) {
    b=100;
  }
  fill(50, 300, b);
  ellipse(colonx, colony, 15, 15);
  ellipse(colonx, colony+80, 15, 15);
}