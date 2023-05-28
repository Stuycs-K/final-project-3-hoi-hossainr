String textDecodeGrayscale(PImage obs){
  // Load pixel array
  obs.loadPixels();
  // Initialize variables
  int n = (obs.pixels).length/4;
  int blockRange = 0, large = 0, small = 0, curChar = 0, ccShift = 0, diff = 0;  
  StringBuilder text = new StringBuilder(" ");
  
  // Go through pixel array
  for(int i = 0; i < n-1; i+=2){
    int pix1 = (obs.pixels[i])&255;
    int pix2 = (obs.pixels[i+1])&255;
    // Determine the larger and smaller pixels.
    if (pix1 >= pix2) {
      large = pix1;
      small = pix2;
    } else {
      large = pix2;
      small = pix1;
    }
    // Calculate difference and the block range.
    diff = large - small;
    for (int k=0; k<ranges.length; k++) {
      if (ranges[k] > diff) {
        blockRange = k-1;
        break;
      }
    }
    // Check if the pixels are able to have encoded data. If not, skip.
    if (((255 - large) < (ranges[blockRange+1] - ranges[blockRange]))
       || (small < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    // Using the block range, go through the amount of bits that are encoded in difference
    for (int j=bitSize[blockRange]-1; j>=0; j--) {
      // Place bit as first bit in character
      curChar = (curChar<<1) | ((diff>>j)&1);
      // Check if eight bits are encoded
      if (ccShift == 7) {
        ccShift = 0;
        // Check if the character is zero. Since a zero character indicates the end of a string, there is no need to go any further.
        if (curChar == 0) break;
        text.append((char)curChar);
        curChar = 0;
      } else {ccShift++;}
    }
  }
  return text.toString(); 
}


String textDecodeColor(PImage obs){
  return "Yes"; 
}
