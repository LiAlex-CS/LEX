//creates the structure of the bingocard template 

void bingoCardTemplate(float bingoTemplateX, float bingoTemplateY, float bingoTemplateSize, color bingoColor, int bingoMode ) {
  fifteen.shuffle();
  thirty.shuffle();
  fourtyFive.shuffle();
  sixty.shuffle();
  seventyFive.shuffle();
  tenBi.shuffle();
  twentyBi.shuffle();
  thirtyBi.shuffle();
  fourtyBi.shuffle();
  fiftyBi.shuffle();
  fiftHex.shuffle();
  oneHunHex.shuffle();
  oneFiftHex.shuffle();
  twoHunHex.shuffle();
  twoFiftHex.shuffle();
  thrOct.shuffle();
  sixOct.shuffle();
  ninOct.shuffle();
  oneTwOct.shuffle();
  oneFiOct.shuffle();
  noFill();
  strokeWeight(bingoTemplateSize/10);
  stroke(bingoColor);
  for (float i=bingoTemplateX; i<bingoTemplateX+5*bingoTemplateSize; i=i+bingoTemplateSize) {
    for (float s=bingoTemplateY; s<bingoTemplateY+5*bingoTemplateSize; s=s+bingoTemplateSize) {
      fill(360);
      rect(i, s, bingoTemplateSize, bingoTemplateSize);
      textSize(bingoTemplateSize);
      textAlign(CENTER);
      fill(bingoColor);
      if (s==bingoTemplateY) {
        if (i==bingoTemplateX) {

          text("B", i+bingoTemplateSize/2, s-bingoTemplateSize/10);
        }
        if (i==bingoTemplateX+bingoTemplateSize*1) {  
          text("I", i+bingoTemplateSize/2, s-bingoTemplateSize/10);
        }
        if (i==bingoTemplateX+bingoTemplateSize*2) {  
          text("N", i+bingoTemplateSize/2, s-bingoTemplateSize/10);
        }
        if (i==bingoTemplateX+bingoTemplateSize*3) { 
          text("G", i+bingoTemplateSize/2, s-bingoTemplateSize/10);
        }
        if (i==bingoTemplateX+bingoTemplateSize*4) { 
          text("O", i+bingoTemplateSize/2, s-bingoTemplateSize/10);
        }
      }
      if (bingoMode==0) {   // DECIMAL
        textSize(bingoTemplateSize/1.3);
        if (i==bingoTemplateX) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(fifteen.get(fif), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
        if (i==bingoTemplateX+bingoTemplateSize*1) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(thirty.get(fif), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*2) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(fourtyFive.get(fif), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*3) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(sixty.get(fif), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*4) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(seventyFive.get(fif), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
      } else if (bingoMode==1) {  //BINARY
        textSize(bingoTemplateSize/5);
        if (i==bingoTemplateX) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(binary(tenBi.get(fif), 7), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
        if (i==bingoTemplateX+bingoTemplateSize*1) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(binary(twentyBi.get(fif), 7), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*2) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(binary(thirtyBi.get(fif), 7), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*3) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(binary(fourtyBi.get(fif), 7), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*4) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(binary(fiftyBi.get(fif), 7), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
      } else if (bingoMode==2) { //HEX
        textSize(bingoTemplateSize/1.5);
        if (i==bingoTemplateX) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(hex(fiftHex.get(fif), 2), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
        if (i==bingoTemplateX+bingoTemplateSize*1) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(hex(oneHunHex.get(fif), 2), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*2) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(hex(oneFiftHex.get(fif), 2), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*3) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(hex(twoHunHex.get(fif), 2), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*4) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text(hex(twoFiftHex.get(fif), 2), i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
      } else if (bingoMode==3) { //OCTAL
        textSize(bingoTemplateSize/2.1);
        if (i==bingoTemplateX) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text((thrOct.get(fif)%8)+(floor(thrOct.get(fif)/8)%8)*10+(floor(floor(thrOct.get(fif)/8)/8)%8)*100, i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
        if (i==bingoTemplateX+bingoTemplateSize*1) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text((sixOct.get(fif)%8)+(floor(sixOct.get(fif)/8)%8)*10+(floor(floor(sixOct.get(fif)/8)/8)%8)*100, i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*2) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text((ninOct.get(fif)%8)+(floor(ninOct.get(fif)/8)%8)*10+(floor(floor(ninOct.get(fif)/8)/8)%8)*100, i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*3) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text((oneTwOct.get(fif)%8)+(floor(oneTwOct.get(fif)/8)%8)*10+(floor(floor(oneTwOct.get(fif)/8)/8)%8)*100, i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }      
        if (i==bingoTemplateX+bingoTemplateSize*4) {
          for (int fif=0; fif<5; fif++) {
            if (fif==round((s-bingoTemplateY)/bingoTemplateSize)) {
              text((oneFiOct.get(fif)%8)+(floor(oneFiOct.get(fif)/8)%8)*10+(floor(floor(oneFiOct.get(fif)/8)/8)%8)*100, i+bingoTemplateSize/2, s-bingoTemplateSize/6 + bingoTemplateSize);
            }
          }
        }
      }
    }
  }
  if (freeSwitch==true) {
    fill(bingoColor);
    rect(bingoTemplateX+bingoTemplateSize*2, bingoTemplateY+bingoTemplateSize*2, bingoTemplateSize, bingoTemplateSize);
    fill(360, 360, 360);
    textSize(bingoTemplateSize/2);
    text("FREE", bingoTemplateX+bingoTemplateSize*2.5, bingoTemplateY+bingoTemplateSize*2.7);
    fill(bingoColor);
  }
}