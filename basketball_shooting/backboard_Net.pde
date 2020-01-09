//the visualizations of the basketball backboard
void backboardNet(float backboardX, float backboardY){
strokeWeight(3);
rect(backboardX-250/2,backboardY-150/2,250,150,25);
fill(0);
rect(backboardX-40,backboardY,80,5);
rect(backboardX-43,backboardY,5,50);
rect(backboardX+38,backboardY,5,50);
fill(255);
strokeWeight(1);
}