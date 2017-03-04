float x1=100,y=100,x2,x3=800,varb;
int num=1;
void setup(){
size(1000,500);

x1=random(width);
x3=random(width);

if( x1<x3){
  x2=x1;
  num=0;
  
}else if (x1>x3){
  x2=x3;
num=1;
}

}

void draw(){
background(255);

stroke(100);




switch(num){
case 0:

line(x1,y,x2,y);

x2=x2+.5;
if(x2>x3){
x2=x1;
}

break;

case 1:

line(x3,y,x2,y);

x2=x2+.5;
if(x2>x1){
x2=x3;
}

break;

case 2:
break;


}




}


void lineFunction(){




}