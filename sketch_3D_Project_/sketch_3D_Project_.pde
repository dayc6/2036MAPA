
float zoom = 10;

PShape obj;

PImage img;

PShape [] children;

void setup() {
  size(1280, 800, P3D);
  background(100);

  setupSerial();

  obj = loadShape("space2.obj");


  img = loadImage("space3.png");
  obj.setTexture(img);

  children = obj.getChildren();
  //printArray(children);
  shapeMode(CENTER);

  obj.scale(40); //original size
}

void draw() {
  
  //blur
  fill(0,30);
  rect(0,0,width,height);
  //end blur
  
  
  scale(1);
  lights();
  translate(width/2, height/2);
  rotateY(radians(90));
  directionalLight(126, 6, 126, 0, 0, -1);
  ambientLight(255, 255, 255);
 
 //rotateX(frameCount*0.03);
  rotateZ(frameCount*0.01);
  shape(obj);

}

void keyPressed() {

  for (int n = 0; n < children.length; n ++) {
    children[n].translate(random(-20, 20), random(-20, 20), random(-20, 20));
  }
}