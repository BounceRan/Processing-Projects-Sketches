class Scene3 {
  Thru thru3;
  PImage b3t;

  Scene3() {
    b3t=loadImage("b3t.png");
    thru3= new Thru("s3.jpg", "b3.jpg");
  }

  void display() {

    thru3.display();
    image(b3t, 250, 300,width,height);
  }
}

