//by dan ran 2017 

int lineNumber=50;
int vNumber=50;
HorizontalLine horizontalLine[]=new HorizontalLine[vNumber];
VerticalLine verticalLine[]=new VerticalLine[lineNumber];



MouseFunction mouseFuntion=new MouseFunction();



void setup() {
  size(1000, 500);
  smooth(2);
  for (int x=0; x<horizontalLine.length; x++) {
    horizontalLine[x]=new HorizontalLine(2);
  }

  for (int x=0; x<verticalLine.length; x++) {
    verticalLine[x]=new VerticalLine(2);
  }
  

 
}

void draw() {
  
  
  background(255);
  
 
  for (int i=0; i<horizontalLine.length; i++) { 
    horizontalLine[i].drawLine();
    //line(horizontalLine[i].x2,horizontalLine[i].y,mouseX,mouseY);
  }
  for (int i=0; i<verticalLine.length; i++) { 
    verticalLine[i].drawLine();
    //line(verticalLine[i].y2,verticalLine[i].x,mouseX,mouseY);
  }
  
  
  
  
mouseFuntion.drawline();

  
}



void mouseClicked(){

mouseFuntion.mouseFunctionUpdate(mouseX,mouseY);

}