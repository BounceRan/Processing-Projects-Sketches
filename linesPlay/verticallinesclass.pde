class VerticalLine {
  float y1, x, y2, y3, varb, lineSpeed;
  int num=1;
  float line_Color=100;
  //float alphaColor=255;
  boolean lineState=false;


  VerticalLine(int lineWeight) {

    int line_Weight=lineWeight;


    strokeWeight(line_Weight);
    stroke(line_Color); 

    y1=random(height);
    y3=random(height);
    x=random(width);
    lineSpeed=random(.5, .9);
    if ( y1<y3) {
      y2=y1;
      num=0;
    } else if (y1>y3) {
      y2=y1;
      num=1;
    }
  }

  void updateInfo() {
    line_Color=100;
    stroke(line_Color);
    y1=random(height);
    y3=random(height);
    x=random(width);
    lineSpeed=random(.5, .9);
    if ( y1<y3) {
      y2=y1;
      num=0;
    } else if (y1>y3) {
      y2=y1;
      num=1;
    }
  }

  void drawLine() {
pushStyle();

    switch(num) {
    case 0:

      stroke(line_Color);
      line(x, y1, x, y2);

      y2=y2+lineSpeed;
      if (y2>y3) {
        y2=y3;
        if (line_Color<=255) {
          line_Color++;
          stroke(line_Color);
          if (line_Color>=255) {

            updateInfo();
          }
        }
      }

      break;
    case 1:
      stroke(line_Color);
      line(x, y1, x, y2);

      y2=y2-lineSpeed;
      if (y2<y3) {
        y2=y3;
        if (line_Color<=255) {
          line_Color++;
          stroke(line_Color);
          if (line_Color>=255) {

            updateInfo();
          }
        }
      }

      break;
    }
      popStyle();
  }
  

}