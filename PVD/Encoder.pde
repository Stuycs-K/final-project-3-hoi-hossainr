void textEncodeGrayscale(PImage orig, String msg){
  orig.loadPixels();
  int n = (orig.pixels).length;
  int diff = 0;
  int large = 0;
  int small = 0;
  int[] ranges = {0, 8, 16, 32, 64, 128};
  int[] bitEncode = {3, 3, 4, 5, 6, 7};
  int blockRange = 0;
  
  // Apply grayscale filtering if not already grayscaled
  orig.filter(GRAY);
  for (int i=0; i<n-1; n+=2) {
    // Get values of pixel 1 and 2 using green values
    int p1 = orig.pixels[i] >> 8 & 0xFF;
    int p2 = orig.pixels[i+1] >> 8 & 0xFF;
    diff = abs(p1 - p2);
    
  }
  orig.updatePixels();
}

void textEncodeColor(PImage orig, String msg){
    
}
