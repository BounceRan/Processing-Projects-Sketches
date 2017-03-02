void keyReleased(){
 if (key=='1'){
  player = minim.loadFile("s1.mp3"); player.play();
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
    
  }else
  {}
if (key=='2'){
  player = minim.loadFile("s2.mp3"); player.play();
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    ellipse( 2, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    ellipse( 3, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
  }
  else
  {}
  
  if (key=='3'){
  player = minim.loadFile("s3.mp3"); player.play();
  stroke(255, 102, 0);
rect(173, 124, 173, 161, 115, 165, 115, 165);

  }
  else
  {}

  if (key=='4'){
  player = minim.loadFile("s4.mp3"); player.play();
  rect(500, 200, 55, 155);
  }
  else
  {}
    if (key=='5'){
  player = minim.loadFile("s5.mp3"); player.play();
  arc(150, 150, 180, 180, 110, PI+QUARTER_PI, OPEN);
  }
  else
  {}
    if (key=='6'){
  player = minim.loadFile("s6.mp3"); player.play();
  rect(500, 400, 355, 155);
  }
  else
  {}
    if (key=='7'){
  player = minim.loadFile("s7.mp3"); player.play();
  ellipse(400,300,200,211);
  }
  else
  {}
    if (key=='8'){
  player = minim.loadFile("s8.mp3"); player.play();
  triangle(130, 175, 158, 120, 186, 175);

  }
  else
  {}
    if (key=='9'){
  player = minim.loadFile("s9.mp3"); player.play();
  triangle(530, 275, 158, 120, 486, 175);
  }
  else
  {}
  
     
      if (key=='l'){
  my = minim.loadFile("myrecording.wav",102); 
  my.loop();
   player.play();
  }
  else
  {}
  
if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();
    }
}

  if ( key == 'r' ) 
  {
    
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
    
    recorder.save();
    println("Done saving.");
  }


}