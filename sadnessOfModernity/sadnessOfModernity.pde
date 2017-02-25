//import processing.io.*;


int level=0, fakeLevelInt, state=0, realThresholdInt;
int timer, sec, number=0;
PFont Mes;
boolean button=false; 
boolean restart=false, timeControl=false, subControl=false;


int buttonIn=1;  //didnt pressed
int buttonPre=1;
int buttonOut;
int Counter=0;



float textsize;



void setup() {
  // GPIO.pinMode(RPI.PIN7, GPIO.INPUT);

  surface.setSize(480, 320);
  Mes=createFont("Corbel", 16, true);
  timer=millis();
  noLoop();
}

void draw() {
  background(0);
  switch(state) {
  case 0:
    RealThreshold();
    FakeThreshold();
    textFont(Mes, 13);
    fill(255);
    text("System:push the button to start your life", .2*width, .5*height);
    noLoop();
    break;

  case 1:
    textFont(Mes, 13);
    fill(255);
    text("System:your top level will be "+fakeLevelInt, .2*width, .5*height);
    break;

  case 2:
    textFont(Mes, 13);
    fill(255);
    text("level:", .4*width, .5*height);
    textFont(Mes, textsize);
   // text("              "+level, .4*width, .5*height);
     text(level, .4*width +50, .5*height);

    if (number<2) {
      timeControl=true;
    } else if (number>1&&timeControl==true) {
      subControl=true;
    } 
    //timer to reset the menu
    if ( !keyPressed&&buttonOut==0&&millis()-timer>=120 && level>=1&&subControl==true) {
      level--;
      timer=millis();
    } else if (level==0&& millis()-timer>=2000 &&restart==true) {
      state=0;
      restart=false;
    }



    break;

    //case 3:

    //  textFont(Mes, 13);
    //  fill(255);
    //  text("level"+level, 10, 20);

    //  break;
  }


  timeC();

  buttonPressed();
  textSizee();


  //contro the button
  if (keyPressed|| buttonOut==1) {
    timeControl=false;
    subControl=false;
    Button();  
    button=true;

    buttonOut=0;
  } else {
    button=false;
  }
  println("realThreshold"+realThresholdInt, "timer"+timer, "number"+number);
}

void Button() {

  if (state==0 && button==false) {

    state=1;
  } else if (button==false &&state==1) {

    state=2;
  } else if (button==false && state==2&& level<realThresholdInt) {

    level++;

    restart=true;
  }
}


void timeC() {
  if (millis()-sec>=1000&&timeControl==true) {
    number++;
    sec=millis();
  } else if (timeControl==false||state==0||keyPressed||buttonOut==1) {
    number=0;
  }
}

void FakeThreshold() {
  float fakeLevel=random(20, 100);
  fakeLevelInt=round(fakeLevel);
}

void RealThreshold() {
  float realThreshold=random(5, 120);
  realThresholdInt=round(realThreshold);
}

void keyPressed() {
  loop();
}

void buttonPressed() {

  //buttonIn=GPIO.digitalRead(RPI.PIN7);

  if (buttonIn!=buttonPre) {

    if (buttonIn==0) {

      //Counter++;
      //buttonOut=1-buttonOut;
      buttonOut=1;

      //println("counter"+Counter);
    } else {
      //println("off");
    }
  }
  loop();
  buttonPre=buttonIn;
}

//void contbutton(){

//if (buttonOut==1){
//Counter++;

//buttonOut=0;


//}


//}
void textSizee() {

  if (buttonOut==1||keyPressed) {

    textsize=40;
  }

  textsize=constrain(textsize*0.95, 15, 42);
}