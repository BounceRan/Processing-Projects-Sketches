

int lineNumber=10;
HorizontalLine horizontalLine[]=new HorizontalLine[lineNumber];
void setup(){
size(1000,500);

for (int x=0; x<horizontalLine.length;x++){
horizontalLine[x]=new HorizontalLine(2);
}

}

void draw(){
background(255);

for(int i=0;i<horizontalLine.length;i++){ 
horizontalLine[i].drawLine();
}





}