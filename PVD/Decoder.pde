String textDecodeGrayscale(PImage obs){
  obs.loadPixels();
  for(int i = 0; i < (obs.pixels).length; i+=2){
    // RGB values are the same in grayscale images
    
  }
  return "Yes"; 
}

String textDecodeColor(PImage obs){
  return "Yes"; 
}

    //StringBuilder bits = new StringBuilder(bytes.length*8);
