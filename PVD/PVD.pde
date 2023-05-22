// Encoding and Decoding text onto image using PVD

String imageName = "Image1.png";
String textToEncode = "This is being encoded using PVD encoding thing";
String modImageName = "modifiedImage1.png";
//true : encoder mode, needs imageName, textToEncode, and modImageName for saving
//false: decoder mode, needs modImageName, prints text.
boolean ETYPE = true;


// For debugging: Prints all the bits of one byte.
void printBinary(int x){
  for(int i=7; i>=0;i--){
    print((x>>i)&1);
  }
  println();
}

PImage img;

void setup(){
  if (ETYPE == true){
    // Load image and set window size
    img = loadImage(imageName);
    windowResize(img.width,img.height);
    //Encode text into PImage
    textEncode(img, textToEncode);
    //Saves the image
    img.save("data/"+modImageName);
  } else {
    img = loadImage(modImageName);
    windowResize(img.width,img.height);
    //Decode image and store text into string
    String decoded = textDecode(img);
    //Print text
    println(decoded);
  }
}

void draw(){
  image(img, 0,0);
}
