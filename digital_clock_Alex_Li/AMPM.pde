void AMPM(float AMPMx, float AMPMy) {

  colorMode (HSB, 100);
  if (hour()<=12) {
    fill(0, 0, 0);
    rect(AMPMx, AMPMy-20, 40, 30); 
    fill(50, 300, 100); 
    textSize(20);
    text("AM", AMPMx, AMPMy);
  } else {
    fill(0, 0, 0);
    rect(AMPMx, AMPMy-20, 40, 30);
    fill(50, 300, 100);
    textSize(20);
    text("PM", AMPMx, AMPMy);
  }
}