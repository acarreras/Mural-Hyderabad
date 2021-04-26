int colors[] = {#FAAE7E, #f7803c, #ed4627, #2e0d23, #f8e4c1 };
color c1 = colors[0];
color c2 = colors[1];
color c3 = colors[2];
color c4 = colors[3];
color c5 = colors[4];

void setup() {
  size(1340, 510); // 670cm x 255cm
  frameRate(8);
}

void draw() {
  background(c1);
  noStroke();
  noFill();
  strokeWeight(4);
  int mida = 51;
  for(int i=0; i<25; i++){
    for(int j=0; j<9; j++){
      pushMatrix();
      translate(i*mida+mida*0.1,j*mida);
      trocet(2*mida, (int)random(0,4));
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key == 'p') noLoop();
  else if (key == 'l') loop();
  else if (key == '+') desplacaColorsEndavant();
  else if (key == '-') desplacaColorsEnrera();
  else if (key == ' ') {
    efectePaper(0,0, width,height, 40);
    pantallazo();
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
  color cc1 = c3;
  color cc2 = c4;
  color cc3 = c5;
  pushStyle();
  noStroke();
  fill(cc1);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc2);
  noFill();
  arc(m-m25,m25, m50,m50, radians(90),radians(180));
  arc(m25,m-m25, m50,m50, radians(270),radians(360));
  // decoracions
  fill(cc3);
  noStroke();
  arc(m25,m25, m13,m13, radians(45), radians(225));
  arc(m-m25,m25, m13,m13, radians(45), radians(225));
  arc(m-m25,m-m25, m13,m13, radians(45), radians(225));
  arc(m25,m-m25, m13,m13, radians(45), radians(225));
  popStyle();
}

void trocetR(float m, float m50, float m25, float m23, float m13){
  color cc1 = c4;
  color cc2 = c5;
  color cc3 = c2;
  pushStyle();
  fill(cc1);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc2);
  arc(m-m25,m-m25, m50,m50, radians(180),radians(270));
  arc(m25,m25, m50,m50, radians(0),radians(90));
  // decoracions
  fill(cc3);
  noStroke();
  circle(m25,m25, m13*0.5);
  circle(m-m25,m25, m13*0.5);
  circle(m-m25,m-m25, m13*0.5);
  circle(m25,m-m25, m13*0.5);
  popStyle();
}

void trocetH(float m, float m50, float m25, float m23, float m13){
  color cc1 = c2;
  color cc2 = c3;
  color cc3 = c5;
  color cc4 = c4;
  pushStyle();
  fill(cc1);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc2);
  line(m25,m50, m-m25,m50);
  fill(cc2);
  noStroke();
  ellipse(m50,m25, m13,m13);
  ellipse(m50,m-m25, m13,m13);
  // decoracions
  fill(cc3);
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
  color cc1 = c3;
  color cc2 = c5;
  color cc3 = c4;
  pushStyle();
  fill(cc1);
  rect(m25,m25, m50,m50);
  ellipse(m25,m25, m23,m23);
  ellipse(m-m25,m25, m23,m23);
  ellipse(m-m25,m-m25, m23,m23);
  ellipse(m25,m-m25, m23,m23);
  strokeWeight(m13);
  stroke(cc2);
  line(m50,m25, m50,m-m25);
  fill(cc2);
  noStroke();
  ellipse(m25,m50, m13,m13);
  ellipse(m-m25,m50, m13,m13);
  // decoracions
  fill(cc3);
  noStroke();
  circle(m50,lerp(m25,m-m25,0.25), m13*0.35);
  circle(m50,lerp(m25,m-m25,0.5), m13*0.35);
  circle(m50,lerp(m25,m-m25,0.75), m13*0.35);
  // decoracions++
  fill(cc2);
  ellipse(m25,m25, m13*0.5,m13*0.5);
  popStyle();
}
