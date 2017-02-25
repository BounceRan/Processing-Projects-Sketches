class Scene2 {
  Thru thru2;
  PImage b2t;

  Scene2() {
    b2t=loadImage("b2t.png");
    thru2= new Thru("s2.jpg", "b2.jpg");
  }

  void display() {

    thru2.display();
    image(b2t, 0, 0,width,height);
  }
}