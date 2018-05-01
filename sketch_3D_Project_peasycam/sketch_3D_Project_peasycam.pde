import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


float zoom = 130;

PShape obj;

PImage img;

PShape [] children;
PeasyCam cam;

void setup() {
  size(900, 600, P3D);
  background(0);
  cam = new PeasyCam(this, 400);
  setupSerial();

  obj = loadShape("space2.obj");
  obj.scale(10);

  img = loadImage("space3.png");
  obj.setTexture(img);

  children = obj.getChildren();
  printArray(children);
  shapeMode(CENTER);
 // translate(width/2, height/2, 0);
  //rotateZ(QUARTER_PI);
  
  translate(width/2,height/2,-100);
}

void draw() {
  background(0);

  lights();

  directionalLight(126, 6, 126, 0, 0, -1);
  ambientLight(255, 255, 255);
  //translate(width/2, height/2);

  //pushMatrix();
  //translate(width/2, height/2, 0);

  //rotateX(frameCount*0.03);
  //rotateZ(frameCount*0.01);
  shape(obj);
  //popMatrix();
}

void keyPressed() {

  for (int n = 0; n < children.length; n ++) {
    children[n].translate(random(-20, 20), random(-20, 20), random(-20, 20));
  }
}