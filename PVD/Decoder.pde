// ranges and bitsize declared in Encoder.pde

String textDecodeGrayscale(PImage obs){
  obs.loadPixels();
  int n = (obs.pixels).length;
  int blockRange = 0, large = 0, small = 0, curChar = 0, ccShift = 0;
  //IntList msgB = new IntList();
  int diff;
  
  StringBuilder text = new StringBuilder(" ");

  for(int i = 0; i < n-1; i+=2){
    diff = abs((obs.pixels[i]&255) - (obs.pixels[i+1]&255));
    if (((obs.pixels[i])&255) > ((obs.pixels[i+1])&255)) {
      large = i;
      small = i+1;
    } else {
      large = i+1;
      small = i;
    }
    
    for (int j=0; j<ranges.length; j++) {
      if (ranges[j] > diff) {
        blockRange = j-1;
        break;
      }
    }
    
    if (((255 - obs.pixels[large]) < (ranges[blockRange+1] - ranges[blockRange]))
       || ((obs.pixels[small]) < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    for (int j=bitSize[blockRange]-1; j>=0; j--) {
      curChar = (curChar<<1) | ((diff>>j)&1);
      if (ccShift == 7) {
        ccShift = 0;
        if (curChar == 0) break;
        //text.append(curChar);
      } else {ccShift++;}
       //msgB.append((diff>>j)&1);
    }
  }
  
  return text.toString(); 
}


String textDecodeColor(PImage obs){
  return "Yes"; 
}
