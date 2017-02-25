class Thru {
  PImage surImg, backImg, cImg;




  int fade=0;

  Thru(String _surImg, String _backImg ) {
    surImg=loadImage(_surImg);
    backImg=loadImage(_backImg);
    cImg=loadImage("cursor.png");
  }





  void display() {




    if (fade==0) {
      fade+=5;
    }
    pushStyle();
    //tint(255,fade);

    image(backImg, 0, 0,width,height);

    image(surImg, 0, 0,width,height);
    popStyle();
    pushStyle();   
    //imageMode(CENTER);
    PImage curImg=backImg.get(mouseX, mouseY, 400, 300);
    image(curImg, mouseX, mouseY, 400, 300);
    image(cImg, mouseX, mouseY);
    popStyle();
    noCursor();
    //cursor(HAND);
  }
}

