import java.util.Arrays;

void textEncodeGrayscale(PImage orig, String msg){
  int diff = 0;
  int large = 0;
  int small = 0;
  int[] ranges = [ 0, 8, 16, 32, 64, 128, 256 ];
  int blockRange = 0;
  IntList msgB = new IntList();
  int[] messageBits;
  
  for (int i=0; i<msg.length(); i++) {
    for (int j=7; j>=0; j--) {
      msgB.append((msg.charAt(i)>>j)&1);
    }
  }
  messageBits = msgB.toArray();
  
  for (int i=0; i<pixels.length-1; i+=2) {
    diff = abs(pixels[i] - pixels[i+1]);
    
    if ((pixels[i]&255) > (pixels[i+1]&255)) {
      large = i;
      small = i+1;
    } else {
      large = i+1;
      small = i;
    }
    
    for (int j=0; j<ranges.length; j++) {
      if (ranges[j] > diff) {
        blockRange = ranges[j-1];
        break;
      }
    }
    
    if (((255 - large) < (ranges[blockRange+1] - ranges[blockRange]))
       || ((small) < (ranges[blockRange+1] - ranges[blockRange]))) {
      continue;
    }
    
    
  }
}

void textEncodeColor(PImage orig, String msg){
  //color version has overlapping blocks in the color channels, instead of neighboring pixels
  //1 block in RG, 1 block GB
}
