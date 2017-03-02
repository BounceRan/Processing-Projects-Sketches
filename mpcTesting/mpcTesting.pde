//Ran,Dan music project cited from processing examples



import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer my;

AudioInput in;
AudioRecorder recorder;


void setup() {
  size(680, 400,P3D);
    minim = new Minim(this);

 in = minim.getLineIn();
recorder = minim.createRecorder(in, "myrecording.wav");
  
  textFont(createFont("Arial", 12));
  noFill();
//player = minim.loadFile("Pageant.mp3");
//  player.play();

}


void draw() {
  
background(0); 
  stroke(255);
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(150 - in.left.get(i)*50,i,150 -in.left.get(i+1)*50, i+1 );
    line(i, 250 + in.right.get(i)*50, i+1,250 + in.right.get(i+1)*50);
    line(width-150 + in.left.get(i)*50,i,width-150 + in.left.get(i+1)*50, i+1 );
  }
  text("pressed 1-9 to release the sound", 5, 15);
String monitoringState = in.isMonitoring() ? "enabled" : "disabled";

if ( recorder.isRecording() )
  {
    text("Currently recording...press 's' to save", 245, 15);
  }
  else
  {
    text("Not recording. pressed 'r' to record",245, 15);
  }

text("pressed 'l' to play what you just record ", 450, 15);
text("pressed 'm' to explode the sound ", 5, 35);

}