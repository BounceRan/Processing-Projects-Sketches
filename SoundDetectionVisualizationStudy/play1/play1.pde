

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;

AudioInput song;
//AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioInput source;
  
  BeatListener(BeatDetect beat, AudioInput source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

void setup()
{
  size(512, 200, P3D);
  surface.setResizable(true);
  minim = new Minim(this);
  
  song=minim.getLineIn();
  
  //song = minim.loadFile("marcus_kellis_theme.mp3", 1024);
  //song.play();
  // a beat detection object that is FREQ_ENERGY mode that 
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. 
  // note that what sensitivity you choose will depend a lot on what kind of audio 
  // you are analyzing. in this example, we use the same BeatDetect object for 
  // detecting kick, snare, and hat, but that this sensitivity is not especially great
  // for detecting snare reliably (though it's also possible that the range of frequencies
  // used by the isSnare method are not appropriate for the song).
  beat.setSensitivity(300);  
  kickSize = snareSize = hatSize = 1;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void draw()
{
  background(0);
  
  // draw a green rectangle for every detect band
  // that had an onset this frame
  float rectW = width / beat.detectSize();
  for(int i = 0; i < beat.detectSize(); ++i)
  {
    // test one frequency band for an onset
    if ( beat.isOnset(i) )
    {
      noStroke();
      fill(random(255),0,random(255),50);
      rect( i*rectW, 0, rectW, height,10);
       fill(random(255),random(155),random(0),50);
      rect( i*rectW+20, 0, rectW, height,10);
    }
  }
  
  // draw an orange rectangle over the bands in 
  // the range we are querying
  //int lowBand = 5;
  //int highBand = 15;
  int lowBand=5;
  int highBand=20;
  // at least this many bands must have an onset 
  // for isRange to return true
  int numberOfOnsetsThreshold = 4;
  if ( beat.isRange(lowBand, highBand, numberOfOnsetsThreshold) )
  {
    fill(232,179,2,200);
    //rect(rectW*lowBand, 0, (highBand-lowBand)*rectW, height);
    rect(rectW*lowBand, 0, width, height);
  }
  
  if ( beat.isKick() ) kickSize = 128;
  if ( beat.isSnare() ) snareSize = 128;
  if ( beat.isHat() ) hatSize = 128;
  
  fill(255);
    
  textSize(kickSize);
  text(":)", width/2, height/2*1.5);
  
  textSize(snareSize);
  text("o", width/2, height/2);
  
  textSize(hatSize);
  text(":(", width/2, height/2*.5);
  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
}