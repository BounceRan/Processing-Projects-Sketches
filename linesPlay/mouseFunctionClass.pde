class MouseFunction{
 float x1, y1, x2, y2,xRange,xRange2,yRange,yRange2;
  float x;
  float y;
  float lineColor;
  int num;
  
  MouseFunction(){
     
  //lineColor=0;

  }

void mouseFunctionUpdate(float XmouseX,float YmouseY){
     x=XmouseX;
  y=YmouseY;
 //stroke(0, 200);
 lineColor=0;
 xRange=random(x-100,x);
  xRange2=random(x,x+100);  
  yRange=random(y-50,y);  
  yRange2=random(y,y+100); 
  x1=x;
  x2=x;
  y1=y;
  y2=y;
 // line(x1, y, x2, y);
num=(int)random(0,3);
}


void drawline(){
  
pushStyle();
   
   x1=(x1>=xRange)?x1-1:x1;
  x2=(x2<=xRange2)?x2+1:x2;
  y1=(y1>=yRange)?y1-1:y1;
  y2=(y2<=yRange2)?y2+1:y2;
  
  
  //line(x, y1, x, y+y2);

  
  //if (lineColor<=255) {
  //    lineColor++;
  //    stroke(lineColor);
  //   line(x1, y, x2, y);
  //   line(x,y1,x,y2);
  //  }
  
  
  
  switch (num){
  case 0:
  
    if (lineColor<=255) {
      lineColor++;
      stroke(lineColor);
     line(x1, y, x2, y);
     line(x,y1,x,y2);
    }
  
  break;
  
  case 1:
    if (lineColor<=255) {
      lineColor++;
      stroke(lineColor);
     line(x1, y, x2, y);
  
    }
  break;
  
  case 2:
    if (lineColor<=255) {
      lineColor++;
      stroke(lineColor);
   
     line(x,y1,x,y2);
    }
  break;
  
  
  
  
  }

  
  
  
popStyle();
}
}