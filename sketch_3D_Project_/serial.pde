import processing.serial.*;


import processing.serial.*;
Serial myPort;

float inValue = 0;

void setupSerial() {


  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
}





void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);

    inValue = float(inString);
    //println(inValue);

    //inValue = map(inValue, 0, 1023, 0, height);
    // println(inValue);
    zoom = inValue;

    if (inValue<50) {
      for (int n = 0; n < children.length; n ++) {
        children[n].translate(random(-40, 40), random(-40, 40), random(-40, 40));
      }
    }
  }
}