int state =  0 ;  

import processing.video.*;

Movie movie;
Movie movie2;
Movie movie3;
Movie movie4;
Movie movie5;

//recording part
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
AudioRecorder recorder;



void setup() {
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "1.m4v");
  movie.loop();
  movie2 = new Movie(this, "2.m4v");
  //movie2.loop();
   movie3 = new Movie(this, "3.m4v");
 movie3.loop();
   movie4 = new Movie(this, "4.m4v");
 movie4.loop();
    movie5 = new Movie(this, "5.m4v");
 movie5.loop();
  
  
  
  
  minim = new Minim(this);
  in = minim.getLineIn( Minim.MONO, 512 );
   //frameRate(25);
}


void movieEvent(Movie m) {
  m.read();
}

void draw(){
  if(state==0){
  image(movie, 0, 0, width, height);}
  else if(state==2){ 
  image(movie2, 0, 0, width, height);}
  else if(state==3){
  image(movie3,0,0,width,height);}
  


float m = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++) {
    if ( abs(in.mix.get(i)) > m ) {
      m = abs(in.mix.get(i));
    }
  }

float db;
db=m*50;
//pos += m * 50;
//  cloud( pos, 150, 80 );
//  if ( pos > width ) {
//    pos = 0;
//  }
  


if(db>5){if(state==0){state=1;}
}else if(state==1){ 
state=0;}

if(db>10){if(state==0){state=2;}
}else if(state==2){ 
state=0;}
if(db>20){image(movie3, 0, 0, width, height);
}else { 
state=0;}
if(db>40){image(movie4, 0, 0, width, height);
}else { 
state=0;}
if(db>80){image(movie5, 0, 0, width, height);
}else { 
state=0;}








//println("m="+db);




//if(30>db&&db>20){  if(state==2){ movie.stop();
//state=0;}
//else{state=2; movie3.play();}

 //println(in.getGain());  
//}


in.enableMonitoring();





}


  
