import processing.serial.*;

Serial port;

float data;

float dataPrev;
float smoothData;
float smoothFactor = 0.001;// 0 - 1, 0 == very smooth(no change), 1 == raw data

void serialEvent(Serial port) { //auto call when serial data comes in
  if (port.available() > 0) {
    dataPrev = smoothData;
    data = port.read();
    
    smoothData = smoothFactor*data + (1-smoothFactor)*dataPrev;
    
    // println(data);
  }
}

void mouseDragged() {
  fill(255);
  ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed() {
  if(key == ' ') {
    background(0);
  }
}

int currentX;

void drawData() {
  float y = map(data, 0, 255, 0, height);
  stroke(255,0,255,200);
  strokeWeight(5);
  line(currentX-1, y, currentX, y);

  y = map(smoothData, 0, 255, 0, height);
  stroke(0,255,255,200);
  strokeWeight(3);
  line(currentX-1, y, currentX, y);

  currentX = (currentX + 1) % width;
  fill(0);
  rect(0,height-25,100,24);
  fill(255);
  text(round(data) +" "+ round(smoothData), 5, height - 5);
}  
///////////////////////
void setup() {
  size(500, 500);
  background(0);

  println(Serial.list());
  //port = new Serial(this, Serial.list()[4], 9600); //establish serial comm to port 2
   port = new Serial(this, "/dev/cu.usbmodem1441", 9600);
  //change port number or name of port based on your sytem
}

void draw() {
  //background(0);
  noStroke();
  fill(0,0,0,1);
  rect(0,0,width,height);
  drawData();
}