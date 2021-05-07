import processing.svg.*;

int colors[] = {#FAAE7E, #5F1B49, #ed4627, #2e0d23, #FFF5E3};
color c1 = colors[0];
color c2 = colors[1];
color c3 = colors[2];
color c4 = colors[3];
color c5 = colors[4];

int mida = 134;
int quantiW = 5;
int quantiH = 3;
ArrayList<Rectangle> zones = new ArrayList<Rectangle>();

void setup() {
  size(1340, 510); // 670cm x 255cm
  //frameRate(8);
  
  creaZones();
  assignaTrocet();
  desplacaColorsEnrera();
}

void draw() {
  background(c1);
  
  for(int i=0; i<zones.size(); i++) {
    Rectangle z = zones.get(i);
    
    pushMatrix();
    translate(z.x, z.y);
    noStroke();
    noFill();
    strokeWeight(4);
    trocet(2*z.w, z.quin);
    popMatrix();
  
    //z.drawR(); // debug
  }

  // simetria perfecta
  PImage mig = get(0,0, int(width*0.5), height);
  pushMatrix();
  translate(width,0);
  scale(-1,1);
  image(mig,0,0);
  popMatrix();
  
  // simetria pero no perfecta
  /*
  for(int i=0; i<zones.size(); i++) {
    Rectangle z = zones.get(i);
    
    pushMatrix();
    translate(width-mida-z.x, z.y);
    noStroke();
    noFill();
    strokeWeight(4);
    trocet(2*z.w, z.quin);
    popMatrix();
  
    //z.drawR(); // debug
  }
  */
}

void keyPressed() {
  if (key == 'p') noLoop();
  else if (key == 'l') loop();
  else if (key == '+') desplacaColorsEndavant();
  else if (key == '-') desplacaColorsEnrera();
  else if (key == ' ') {
    //efectePaper(0,0, width,height, 40);
    pantallazo();
  }
  else if(key == 'r'){ // nous trocets
    zones.clear();
    creaZones();
    assignaTrocet();
  }
}

void desplacaColorsEndavant(){
  color cc = c1;
  c1 = c2;
  c2 = c3;
  c3 = c4;
  c4 = c5;
  c5 = cc; 
  colors[0] = c1;
  colors[1] = c2;
  colors[2] = c3;
  colors[3] = c4;
  colors[4] = c5;
}

void desplacaColorsEnrera(){
  color cc = c5;
  c5 = c4;
  c4 = c3;
  c3 = c2;
  c2 = c1;
  c1 = cc;
  colors[0] = c1;
  colors[1] = c2;
  colors[2] = c3;
  colors[3] = c4;
  colors[4] = c5;
}

void pantallazo(){
  String d = year() + "_" + nf(month(),2) + "_"  + nf(day(),2) + "_";
  d = d + nf(hour(),2) + "_"  + nf(minute(),2) + "_"  + nf(second(),2);
  
  String filename = "./../captures/mural" + "_" + d + ".png";
  println("  --- pantallazo capturat");
  save(filename);
}

void efectePaper(float x, float y, float w, float h, int alpha){
  pushMatrix();
  pushStyle();
  translate(x,y);
  noStroke();
  for (int i = 0; i<w-1; i+=2) {
    for (int j = 0; j<h-1; j+=2) {
      fill(random(125-11, 125+11), alpha);
      rect(i, j, 2, 2);
    }
  }
  popMatrix();
  popStyle();
}

void trocet(float m, int n){
  float mm = 1.; //map(mouseX, 0, width, 0., 5.);
  float mida50 = mm*m*0.5;
  float mida25 = mm*m*0.25;
  float mida23 = mida50*(2./3.);
  float mida13 = mida50*(1./3.);

  if(n == 0){
    trocetL(m, mida50, mida25, mida23, mida13);
  }
  else if(n == 1){
    trocetR(m, mida50, mida25, mida23, mida13);
  }
  else if(n == 2){
    trocetH(m, mida50, mida25, mida23, mida13);
  }
  else if(n == 3){
    trocetV(m, mida50, mida25, mida23, mida13);
  }
}

void trocetL(float m, float m50, float m25, float m23, float m13){
  color cc1 = c4;
  color cc2 = c1;
  color cc3 = c2;
  color cc4 = c5;
  pushStyle();
  noStroke();
  fill(cc1);
  rect(m25,m25, m50,m50);
  fill(cc2);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc3);
  noFill();
  arc(m-m25,m25, m50,m50, radians(90),radians(180));
  arc(m25,m-m25, m50,m50, radians(270),radians(360));
  // decoracions
  fill(cc4);
  noStroke();
  float d = m13*0.7;
  // decoració sobre m-m25,m-m25 n'apareixen menys
  if(m >= mida){
    circle(m-m25+d*cos(radians(45)),m25+d*sin(radians(45)), m13*0.2);
    circle(m-m25+d*cos(radians(90)),m25+d*sin(radians(90)), m13*0.2);
    circle(m-m25+d*cos(radians(135)),m25+d*sin(radians(135)), m13*0.2);
    circle(m-m25+d*cos(radians(180)),m25+d*sin(radians(180)), m13*0.2);
    circle(m-m25+d*cos(radians(225)),m25+d*sin(radians(225)), m13*0.2);
  }
  popStyle();
}

void trocetR(float m, float m50, float m25, float m23, float m13){
  color cc1 = c4;
  color cc2 = c1;
  color cc3 = c2;
  color cc4 = c5;
  pushStyle();
  fill(cc1);
  rect(m25,m25, m50,m50);
  fill(cc2);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc3);
  arc(m-m25,m-m25, m50,m50, radians(180),radians(270));
  arc(m25,m25, m50,m50, radians(0),radians(90));
  // decoracions
  fill(cc4);
  noStroke();
  circle(m25,m25, m13*0.5);
  circle(m-m25,m25, m13*0.5);
  circle(m-m25,m-m25, m13*0.5);
  circle(m25,m-m25, m13*0.5);
  popStyle();
}

void trocetH(float m, float m50, float m25, float m23, float m13){
  color cc1 = c4;
  color cc2 = c1;
  color cc3 = c2;
  color cc4 = c5;
  pushStyle();
  fill(cc1);
  rect(m25,m25, m50,m50);
  fill(cc2);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc3);
  line(m25,m50, m-m25,m50);
  fill(cc3);
  noStroke();
  ellipse(m50,m25, m13,m13);
  ellipse(m50,m-m25, m13,m13);
  // decoracions
  fill(cc4);
  noStroke();
  circle(m25,m25, m13*0.5);
  circle(m-m25,m25, m13*0.5);
  circle(m-m25,m-m25, m13*0.5);
  circle(m25,m-m25, m13*0.5);
  // decoracions++
  fill(cc4);
  noStroke();
  circle(lerp(m25,m-m25,0.25),m50, m13*0.35);
  circle(lerp(m25,m-m25,0.5),m50, m13*0.35);
  circle(lerp(m25,m-m25,0.75),m50, m13*0.35);
  popStyle();
}

void trocetV(float m, float m50, float m25, float m23, float m13){
  color cc1 = c4;
  color cc2 = c1;
  color cc3 = c2;
  color cc4 = c5;
  color cc5 = c3;
  pushStyle();
  fill(cc1);
  rect(m25,m25, m50,m50);
  fill(cc2);
  rect(m25,m25, m50,m50);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc3);
  line(m50,m25, m50,m-m25);
  fill(cc3);
  noStroke();
  ellipse(m25,m50, m13,m13);
  ellipse(m-m25,m50, m13,m13);
  // decoracions
  fill(cc4);
  noStroke();
  circle(m50,lerp(m25,m-m25,0.25), m13*0.35);
  circle(m50,lerp(m25,m-m25,0.5), m13*0.35);
  circle(m50,lerp(m25,m-m25,0.75), m13*0.35);
  // decoracions++
  fill(cc5);
  ellipse(m25,m25, m13*0.5,m13*0.5);
  popStyle();
}

class Rectangle {
  float x;
  float y;
  float w;
  float h;
  float cX;
  float cY;
  int quin = 99;
  float prob = 0.; // debug
  
  Rectangle(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    cX = x + w*0.5;
    cY = y + h*0.5;
  }
  
  float getCx(){ // centre x
    return cX;
  }
  
  float getCy(){ // centre y
    return cY;
  }
  
  void drawR(){ // debug
    noFill();
    stroke(0,255,255);
    strokeWeight(0.5);
    rect(x,y, w,h);
    fill(0,155,155);
    text(quin, x+10, y+15);
    text(prob, x+10, y+25);
  }
}

void creaZones(){
  for(int i=0; i<quantiW; i++){
    for(int j=0; j<quantiH; j++){
      zones.add(new Rectangle(i*mida,j*mida, mida,mida));
    }
  }
  
  for (int i=zones.size()-1; i>= 0; i--){
    Rectangle z = zones.get(i);
    float prob = map(abs(width*.5-mida - z.x), 0, width*0.5, 0.9,0.);
    z.prob = prob;
    if (random(1) > prob) { // subdivideix
      zones.add(new Rectangle(z.x,z.y, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x+z.w*0.5,z.y, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x,z.y+z.h*0.5, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x+z.w*0.5,z.y+z.h*0.5, z.w*0.5,z.h*0.5));
      zones.remove(i);  
    }
  } 
  for (int i=zones.size()-1; i>= 0; i--){
    Rectangle z = zones.get(i);
    float prob = map(abs(width*.5-mida - z.x), 0, width*0.5, 0.8,0.);
    z.prob = prob;
    if (random(1) > prob) { // subdivideix
      zones.add(new Rectangle(z.x,z.y, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x+z.w*0.5,z.y, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x,z.y+z.h*0.5, z.w*0.5,z.h*0.5));
      zones.add(new Rectangle(z.x+z.w*0.5,z.y+z.h*0.5, z.w*0.5,z.h*0.5));
      zones.remove(i);  
    }
  }
}

void assignaTrocet(){
  for(int i=0; i<zones.size(); i++) {
    Rectangle z = zones.get(i);
    z.quin = (int)random(0,4);
  }
}
