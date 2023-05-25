void textEncodeGrayscale(PImage orig, String msg){
  int n = pixels.length;
  int diff = 0;
  int large = 0;
  int small = 0;
  int[] ranges = {0, 8, 16, 32, 64, 128};
  int[] bitEncode = {3, 3, 4, 5, 6, 7};
  int blockRange = 0;
  
  for (int i=0; i<pixels.length-1; n+=2) {
    diff = abs(pixels[i] - pixels[i+1]);
    
  }
}

void textEncodeColor(PImage orig, String msg){
    
}
