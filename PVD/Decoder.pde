// ranges and bitsize declared in Encoder.pde

/*
String textDecodeGrayscale(PImage obs){
  obs.loadPixels();
  int n = (obs.pixels).length;
  int blockRange = 0;
  int large = 0;
  int small = 0;
  IntList msgB = new IntList();
  int diff;
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
      // curChar = (curChar<<1) | ((diff>>j)&1);
      // if ccShift == 7 set to 0 and append msgB else ccShift++;
       msgB.append((diff>>j)&1);
    }
  }
  StringBuilder text = new StringBuilder();
    //char curChar = 0;
  //int ccShift = 7;
   //     newchar=(newchar<<2)|parts.get(i+1);
   // curChar = (curChar<<1) | msgB
    // shift bits : bitSize[blockRange]
  }
  return text.toString(); 
}

String textDecodeColor(PImage obs){
  return "Yes"; 
}
/*
