class Scene1 {
  Thru thru1;

  PImage b1t;
  Scene1() {
    b1t=loadImage("b1t.png");
    thru1= new Thru("s1.jpg", "b1.jpg");
  }

  void display() {

    thru1.display();
    image(b1t, 0, 0,width,height);
  }
}

