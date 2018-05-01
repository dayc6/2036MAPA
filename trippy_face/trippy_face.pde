
PShape obj;

PImage img;

PShape [] children;

void setup() {
  size(900, 1000, P3D);
  background(100);

  obj = loadShape("ironmanface.obj");
  obj.scale(50);

  img = loadImage("trippy.png");
  obj.setTexture(img);

  children = obj.getChildren();
  printArray(children);
}

void draw() {
  background(0);

  lights();

  directionalLight(126, 6, 126, 0, 0, -1);
  ambientLight(255, 255, 255);

  translate(width/2, height/2);

  rotateX(frameCount*0.03);
  rotateZ(frameCount*0.01);
  shape(obj);
}

void keyPressed() {

  for (int n = 0; n < children.length; n ++) {

    children[n].translate(random(-20, 20), random(-20, 20) ,random(-20, 20));
  }
}