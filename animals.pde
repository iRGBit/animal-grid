PImage[] animals;
//
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

int colsize = 30;
int spacing = 2;
int numanimals; 

void setup() {
  size(1920, 1080);
  background(240);
  //noSmooth();

  String path = sketchPath+"/data/";
  File[] files = listFiles(path);

  print(path+"\n");
  numanimals = files.length;
  print(numanimals+"\n"); //how many files are here
  println();
  noLoop();
  animals=new PImage[files.length];


  for (int i=0; i<files.length; i++) {
    animals[i]=loadImage(files[i].getName());
  }
}
void draw() {
  for (int j =0; j< height; j+= colsize+spacing) {
    for (int i = 0; i<width; i+= colsize+spacing) {
      PImage myanimal = animals[floor(random(0,numanimals))];
      color mycol = colors[(int) random(0, colors.length)];
      //tint(mycol);
      image(myanimal, i, j, colsize, colsize);
      
    }
  }
  //filter(INVERT);
  save("animals4.png");
}
  File[] listFiles(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      File[] files = file.listFiles();
      return files;
    } else {
      // If it's not a directory
      return null;
    }
  }

