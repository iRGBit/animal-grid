// Animal Grid
// Code by Birgit Bachler, 2015 www.birgitbachler.com

PImage[] animals;

//Use colors or not
//color[] colors= {
//  color(254, 67, 101, 240),
//  color(252, 157, 154, 240),
//  color(249, 205, 173, 240),
//  color(200, 200, 169, 240),
//  color(131, 175, 155, 240),
//};


//color[] colors= {
//  color(255, 240),
//  color(238, 35, 43, 240),
//  color(72, 170, 219, 240),
//  color(240, 227, 1, 240),
//  color(169, 161, 7, 240),
//  color(23, 147, 209, 240),
//};


color[] colors= {
  color(1, 146, 139, 240), 
  color(197, 172, 45, 240), 
  color(230, 108, 33, 240), 
  color(198, 52, 39, 240), 
  color(255, 240),
};

int colsize = 30; // how big are your animals h=w
int spacing = 2; // padding
int numanimals; // number of files in your data folder

void setup() {
  size(1920, 1080); // Full HD
  background(240); // almost white

  String path = sketchPath+"/data/"; // where's your animals
  File[] files = listFiles(path); // grab files from specified path

    //  print(path+"\n"); // for debugging: print path
  numanimals = files.length; // how many files in your path?
  print(numanimals+"\n"); //debug: number of files
  println(); // debug: prettyprint
  noLoop(); // make it a static image
  animals=new PImage[files.length]; // initialize array with number of files in path


  for (int i=0; i<files.length; i++) {
    animals[i]=loadImage(files[i].getName()); // loop through array and load images per filename
  }
}
void draw() {
  for (int y =0; y< height; y+= colsize+spacing) { // loop over screen vertically, y direction
    for (int x = 0; x<width; x+= colsize+spacing) { // while looping vertically also loop horizontally, x direction
      PImage myanimal = animals[floor(random(0, numanimals))]; // randomly pick one animal from your array
      color mycol = colors[(int) random(0, colors.length)];  // if you want color, pick a random one from the color array
      //tint(mycol); // color the animal!
      image(myanimal, x, y, colsize, colsize); // finally plot the animal image at coordinates x and y and width and height colsize
    }
  }
  //filter(INVERT); // experiment with negative output, only makes sense if not using color
  save("animals4.png");
}

File[] listFiles(String dir) { // this function grabs files from specified path and avoids loading directories - to do: avoid other than .jpg, .png, .tif
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}

