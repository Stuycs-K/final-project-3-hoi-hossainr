void textEncodeGrayscale(PImage orig, String msg){
  // Initialize variables
  int diff = 0, newDiff = 0, large = 0, small = 0, msgInd = 0, blockRange = 0;
  float m = 0;
  IntList messageBits = new IntList();  
  int[] msgBits;
  
  // Separate string into bits, stored as integers of 0 and 1
  for (int i=0; i<msg.length(); i++) {
    for (int j=7; j>=0; j--) {
      messageBits.append((msg.charAt(i)>>j)&1);
    }
  }
  
  // Store bits into a int array for easier access
  msgBits = messageBits.toArray();
  messageBits.clear();
  
  // Use grayscale filter on image, if it isn't already grayscaled
  orig.filter(GRAY);
  
  // Go through pixel array
  for (int p=0; p<(orig.pixels).length-1; p+=2) {
    int pix1 = (orig.pixels[p])&255;
    int pix2 = (orig.pixels[p+1])&255;
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
    
    // Skip if the highest addable value or subtracable value cause over/under flow on any of the two pixels.
    if (((255 - large) < (ranges[blockRange+1] - ranges[blockRange]))
       || (small < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    // Calculate the new difference by using lower range and encoding data onto it.
    newDiff = ranges[blockRange];
    for (int ls=bitSize[blockRange]-1; ls>=0; ls--) {
      newDiff &= ~(1 << ls);
      if (msgInd < msgBits.length){
        newDiff |= ((msgBits[msgInd] << ls) & (1 << ls) );
        msgInd++;
      }
    }
    
    // Calculate the two new pixel values
    m = float(abs(newDiff - diff));
    if ((pix1 >= pix2) && (newDiff > diff)) {
      pix1 += int(ceil(m/2.0));
      pix2 -= int(floor(m/2.0));
    } else if ((pix1 < pix2) && (newDiff > diff)) {
      pix1 -= int(floor(m/2.0));
      pix2 += int(ceil(m/2.0));
    } else if ((pix1 >= pix2) && (newDiff <= diff)) {
      pix1 -= int(ceil(m/2.0));
      pix2 += int(floor(m/2.0));
    } else if ((pix1 < pix2) && (newDiff <= diff)) {
      pix1 += int(ceil(m/2.0));
      pix2 -= int(floor(m/2.0));
    }
    // Change pixel values
    orig.pixels[p] = (255 << 24) + (pix1 << 16) + (pix1 << 8) + pix1;
    orig.pixels[p+1] = (255 << 24) + (pix2 << 16) + (pix2 << 8) + pix2;

  }
  // Update pixel array onto PImage
  orig.updatePixels();
}

void textEncodeColor(PImage orig, String msg){
  //color version has overlapping blocks in the color channels, instead of neighboring pixels
  //1 block in RG, 1 block GB
}
