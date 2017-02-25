/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */
 
 import ddf.minim.*;
 import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
BeatDetect beat;

 float eRadius;
 
void setup() {
  size(720, 640,P3D);
   surface.setResizable(true);
  
     minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
   beat = new BeatDetect();
   ellipseMode(RADIUS);
  eRadius = 50;
}

void draw() {

  background(0);
 
 stroke(random(100,255));

   for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    
    //rect(random(width/2), random(height/2),in.left.get(i)*50, in.left.get(i)*50);
    
    //line( i, height/2 + in.left.get(i)*50, i+width/3+1, height/2 + in.left.get(i+1)*50 );
     line(width/3 + in.left.get(i)*50,i, width/3*.9 +in.left.get(i+1)*50, i+1 );
     line(width*0.8 + in.left.get(i)*50,i, width*.85 +in.left.get(i+1)*50, i+1 );
     
  }
  
  noStroke();
  beat.detect(in.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(255, 255, 0, a);
  if ( beat.isOnset() ) eRadius = 250;
  rectMode(CENTER);
  rect(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 50 ) eRadius = 100;
  
  
}