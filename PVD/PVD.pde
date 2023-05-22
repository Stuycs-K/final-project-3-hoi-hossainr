// Encoding and Decoding text onto image using PVD
String imageName = "Image.png";
String textToEncode = "This is being encoded using PVD encoding thing";
String modImageName = "modifiedImage.png";
//true : encoder mode, needs imageName, textToEncode, and modImageName for saving
//false: decoder mode, needs modImageName and imageName for saving.
boolean ENCODETYPE = true;


// For debugging: Prints all the bits of one byte.
void printBinary(int x){
  for(int i=7; i>=0;i--){
    print((x>>i)&1);
  }
  println();
}

PImage image;
PImage modImage;

void setup(){
  image = loadImage(imageName);
  size(image.width,image.height);
  if (ENCODETYPE == true){
    textEncode(image, textToEncode);
  } else {
    modImage = loadImage(modImageName);
    String decoded = textDecode(modImage);
  
  }
}

void draw(){
  
}
