void textEncodeGrayscale(PImage orig, String msg){
  int n = pixels.length;
  int diff = 0;
  int large = 0;
  int small = 0;
  int[] ranges = new int[6];
  ranges[0] = 0;
  ranges[1] = 8;
  ranges[2] = 16;
  ranges[3] = 32;
  ranges[4] = 64;
  ranges[5] = 128;
  int blockRange = 0;
  
  for (int i=0; i<pixels.length-1; n+=2) {
    diff = abs(pixels[i] - pixels[i+1]);
    
  }
}

void textEncodeColor(PImage orig, String msg){
    
}
