public static int[] ranges = {0, 8, 16, 32, 64, 128, 256};
public static int[] bitSize = {3, 3, 4, 5, 6, 7};

void textEncodeGrayscale(PImage orig, String msg){
  int diff = 0, newDiff = 0, large = 0, small = 0, msgInd = 0, blockRange = 0;
  float m = 0;
  IntList messageBits = new IntList();
  int[] msgBits;
  
  for (int i=0; i<msg.length(); i++) {
    for (int j=7; j>=0; j--) {
      messageBits.append((msg.charAt(i)>>j)&1);
    }
  }
  msgBits = messageBits.toArray();
  orig.filter(GRAY);
  
  for (int p=0; p<(orig.pixels).length-1; p+=2) {
    if (((orig.pixels[p])&255) >= ((orig.pixels[p+1])&255)) {
      large = p;
      small = p+1;
    } else {
      large = p+1;
      small = p;
    }
    diff = (orig.pixels[large]&255) - (orig.pixels[small]&255);
    
    for (int k=0; k<ranges.length; k++) {
      if (ranges[k] > diff) {
        blockRange = k-1;
        break;
      }
    }
    if (((255 - (orig.pixels[large]&255)) < (ranges[blockRange+1] - ranges[blockRange]))
       || ((orig.pixels[small]&255) < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    newDiff = ranges[blockRange];
    for (int l=bitSize[blockRange]; l>=0; l--) {
      if (msgInd < msgBits.length) {
        newDiff += (msgBits[msgInd] << l);
        msgInd++;
      } else {
        newDiff = newDiff | ~(1 << l);
      }
    }
    int pix1 = orig.pixels[p] >> 16 & 0xFF;
    int pix2 = orig.pixels[p+1] >> 16 & 0xFF;
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
    orig.pixels[p] = (255 << 24) + (pix1 << 16) + (pix1 << 8) + pix1;
    orig.pixels[p+1] = (255 << 24) + (pix2 << 16) + (pix2 << 8) + pix2;
    
  }
  orig.updatePixels();
}

void textEncodeColor(PImage orig, String msg){
  //color version has overlapping blocks in the color channels, instead of neighboring pixels
  //1 block in RG, 1 block GB
}
>>>>>>> b1de71a40e0a8c905307a892fd706fe59f829335
