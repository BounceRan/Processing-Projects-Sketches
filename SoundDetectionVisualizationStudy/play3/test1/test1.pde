import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
//AudioPlayer mySound;
 AudioInput mySound;
 
 
void setup(){
  size(800, 800,P3D);
   surface.setResizable(true);
  noStroke();
  rectMode(CENTER);
  minim = new Minim(this);
  mySound=minim.getLineIn();
  
  //mySound = minim.loadFile("sound.mp3");
  //mySound.play();
}
int n=0;
void draw(){
  background(0);
  translate(width/2,height/2);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
    rotateX(n*-PI/6*0.15);
    rotateY(n*-PI/6*0.15);
    rotateZ(n*-PI/6*0.05);
    fill(random(255),random(0),random(255));
    rect(i,100,mySound.left.get(i)*150,mySound.left.get(i)*50);
        fill(random(255),random(255),random(0));
        ellipse(i+50,150,mySound.left.get(i)*50,mySound.left.get(i)*50);

  }
  n++;
}
 
//mute out
void keyPressed(){
  if ( key == 'm'|| key == 'M' ){
    if ( mySound.isMuted() ){
      mySound.unmute();
    }
    else{
      mySound.mute();
    }
  }
}
 
void stop(){
  mySound.close();
  minim.stop();
  super.stop();
}