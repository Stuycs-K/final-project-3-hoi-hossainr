import java.util.Arrays;

public static int[] ranges = {0, 8, 16, 32, 64, 128, 256};
public static int[] bitSize = {3, 3, 4, 5, 6, 7};

void textEncodeGrayscale(PImage orig, String msg){
  int diff, newDiff, large, small, blockRange, msgInd = 0, 0, 0, 0, 0, 0;
  float m = 0.0;
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
    
    for (int k=0; j<ranges.length; k++) {
      if (ranges[k] > diff) {
        blockRange = k-1;
        break;
      }
    }
    
    if (((255 - orig.pixels[large]) < (ranges[blockRange+1] - ranges[blockRange]))
       || ((orig.pixels[small]) < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    
    newDiff = ranges[blockRange];
    for (int l=bitSize[blockRange]; l>=0; l--) {
      if (msgInd < msgBits.length) {
        newDiff += msgBits[msgInd]*pow(2, l);
        msgInd++;
      } else {
        newDiff = newDiff | ~(1 << l);
      }
    }
    
    m = float(abs(newDiff - diff));
    if ((orig.pixels[p] >= orig.pixels[p+1]) && (newDiff > diff)) {
      orig.pixels[p] += int(ceil(m/2.0));
      orig.pixels[p+1] -= int(floor(m/2.0));
    } else if ((orig.pixels[p] < orig.pixels[p+1]) && (newDiff > diff)) {
      orig.pixels[p] -= int(floor(m/2.0));
      orig.pixels[p+1] += int(ceil(m/2.0));
    } else if ((orig.pixels[p] >= orig.pixels[p+1]) && (newDiff <= diff)) {
      orig.pixels[p] -= int(ceil(m/2.0));
      orig.pixels[p+1] += int(floor(m/2.0));
    } else if ((orig.pixels[p] < orig.pixels[p+1]) && (newDiff <= diff)) {
      orig.pixels[p] += int(ceil(m/2.0));
      orig.pixels[p+1] -= int(floor(m/2.0));
    }
  }
  orig.updatePixels();
}

void textEncodeColor(PImage orig, String msg){
  //color version has overlapping blocks in the color channels, instead of neighboring pixels
  //1 block in RG, 1 block GB
}
