
int timer;

 import ddf.minim.analysis.*;
  import ddf.minim.*;

int SceneNum=1; 
Scene1 scene1;
Scene2 scene2;
Scene3 scene3;

 Minim minim;
  AudioPlayer backsound;


void setup() {
  size(1200, 800);
if (frame != null) {
    frame.setResizable(true);
  }
  scene1= new Scene1();
  scene2=new Scene2();
   scene3=new Scene3();
  
    minim = new Minim(this);
backsound= minim.loadFile("sound/snd2.mp3",512);
backsound.setGain(-20.0);
}

void draw() { 


  switch(SceneNum) {
  case 1:
 
 
 
    scene1.display();
        
    break;

  case 2:
   

    scene2.display();
    break;
      case 3:
      

    scene3.display();
    break;
  }



  if (millis()-timer>15000) {
    timer=millis();

    SceneNum++;  
    if (SceneNum>3) {
      SceneNum=1;
    }
  }
  
}



void mouseReleased() {
  
  backsound.play();
  backsound.rewind();
  //next image //every time mouse click add one
  SceneNum++;
  //after the last picture, go back to the first picture
  if (SceneNum>3) {
    SceneNum=1;
  }
  println("SceneNum="+SceneNum);
}


