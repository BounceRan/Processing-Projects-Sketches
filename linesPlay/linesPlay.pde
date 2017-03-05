//by dan ran 2017 
PImage img;

boolean rectOver = false;
int lineNumber=20;
int vNumber=10;
HorizontalLine horizontalLine[]=new HorizontalLine[vNumber];
VerticalLine verticalLine[]=new VerticalLine[lineNumber];

//ArrayList<MouseFunction> mouseFunction= new ArrayList<MouseFunction>();

MouseFunction mouseFuntion=new MouseFunction();



void setup() {
  size(1000, 500);
  img = loadImage("logo.png");
  imageMode(CENTER);
  smooth(2);
  for (int x=0; x<horizontalLine.length; x++) {
    horizontalLine[x]=new HorizontalLine(3);
  }

  for (int x=0; x<verticalLine.length; x++) {
    verticalLine[x]=new VerticalLine(3);
  }
  

 
}

void draw() {
  
  //update(mouseX, mouseY);
  background(255);
  
 
  for (int i=0; i<horizontalLine.length; i++) { 
    horizontalLine[i].drawLine();
    stroke(240);
    line(horizontalLine[i].x2,horizontalLine[i].y,mouseX,mouseY);
  }
  for (int i=0; i<verticalLine.length; i++) { 
    verticalLine[i].drawLine();
   // line(verticalLine[i].y2,verticalLine[i].x,mouseX,mouseY);
  }
  
  
  //for (int i = 0; i < mouseFunction.size(); i++) {
  //MouseFunction part = mouseFunction.get(i);
  //part.drawline();
//}

mouseFuntion.drawline();
pushStyle();
//pushMatrix();
rectMode(CENTER);
fill(255,200);
noStroke();
rect(width/2,height/2,256,256);
image(img,width/2,height/2);

if(mouseX>=width/2-128 && mouseX<=width/2+128&& mouseY>=height/2-128&&mouseY<=height/2+128){
rectOver=true;
}else{
rectOver=false;
}
 //println(rectOver);

if(rectOver==true){
  fill(0,20);
  cursor(HAND);
rect(width/2,height/2,250,250);
//if(mousePressed){
//link("danranpresent.com");
//}
}else{
  noCursor();
  
  //cursor(ARROW);
  //noFill();
//rect(width/2,height/2,256,256);};

 

//popMatrix();
}
popStyle();
}
//boolean rectOver(){
//if(mouseX>=width/2-128 && mouseX<=width/2+128&& mouseY>=height/2-128&&mouseY<=height/2+128){
//return true;
//}else{
//return false;
//}
//}





void mouseClicked(){
//mouseFunction.add(new MouseFunction());
  if(rectOver==true){
 
link("http://www.danranpresent.com");
}
//   for (int i = 0; i < mouseFunction.size(); i++) {
//  MouseFunction part = mouseFunction.get(i);
//  part.mouseFunctionUpdate(mouseX,mouseY);
//}
mouseFuntion.mouseFunctionUpdate(mouseX,mouseY);

}