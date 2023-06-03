// Encoding and Decoding text onto image using PVD

// Name of file that is being encoded
String imageName = "whale.png";
// Message to encode
String textToEncode = "flag{wH4l3_WIth_4_T4L3}";
PImage imageToEncode;
// Name of file that has or will have encoded text
String modImageName = "modifiedWhale.png";

//ENCODE: encoder mode, needs imageName, textToEncode, and modImageName for saving
//DECODE: decoder mode, needs modImageName, prints text.
char MODE = DECODE;

//GRAYSCALE: encode using grayscale pixel method
//COLOR    : encode using colored pixel method
char IMGTYPE = GRAYSCALE;

PImage img;

void setup(){
  if (MODE == ENCODE){
    //Load image for hiding
    imageToEncode = loadImage("horse.png");
    // Load image and set window size
    img = loadImage(imageName);
    windowResize(img.width,img.height);
    //Encode text into PImage
    if (IMGTYPE == GRAYSCALE){
      textEncodeGrayscale(img, imageToEncode);
    } else {
      textEncodeColor(img, textToEncode);
    }
    //Saves the image
    img.save("data/"+modImageName);
  } else if (MODE == DECODE){
    img = loadImage(modImageName);
    windowResize(img.width,img.height);
    //Decode image and store text into string
    String decoded;
    String[] output = new String[1];
    if (IMGTYPE == GRAYSCALE){
      decoded = textDecodeGrayscale(img);
    } else {
      decoded = textDecodeColor(img);
    }
    //Print text
    println(decoded);
    output[0] = decoded;
    saveStrings("hiddenImage", output);
  }
}

void draw(){
  image(img, 0,0);
}
