

int lineNumber=10;
HorizontalLine horizontalLine[]=new HorizontalLine[lineNumber];
VerticalLine verticalLine[]=new VerticalLine[lineNumber];

void setup(){
size(1000,500);
smooth(2);
for (int x=0; x<horizontalLine.length;x++){
horizontalLine[x]=new HorizontalLine(2);
}

for (int x=0; x<verticalLine.length;x++){
verticalLine[x]=new VerticalLine(2);
}

}

void draw(){
background(255);

for(int i=0;i<horizontalLine.length;i++){ 
horizontalLine[i].drawLine();
}
for(int i=0;i<verticalLine.length;i++){ 
verticalLine[i].drawLine();
}




}