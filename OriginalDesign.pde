int x = 0;
int dashx = 0;
float e = 0;
int wingX = 0;
int n = 20;
int p = 200;
int wing = -1;
int wingTwo = -1;
int wingY = 151;
int wingYtwo = 151;

//FOR BIKER
int q = 0;
int back = 190; // \, ==== 
int backShift = -1; // < ====
int r =(int)(Math.random()*256);
int g =(int)(Math.random()*256);
int b =(int)(Math.random()*256);
int rightY = 470;// < == 
int move = -1;// < ==
float spin = 0.0;
//
void setup()
{
  size(800,600);
  frameRate(80);
}
void draw()
{
  background(119,133,155); // 197
  //window();
  //ellipse(x,400,100,100); //car??
  window();
  road();
  trees();
  clouds();
  bird();
  
  ////////////FOR BIKER  ///////////////
  pushMatrix();
  //translate(width*0.2, height*0.5);
  translate(q + 70,520);
  //rotate(frameCount/5.0);
  rotate(spin);
  //polygon(0, 0, 50, 4);  // Triangle
  fill(0,0,0,150);
  rect(0,0,2,50);
  rect(0,0,50,2);
  rect(0,0,-50,2);
  rect(0,0,2,-50);
  //rect(0,0,5,100);
  popMatrix();
  // V cleaner V
  pushMatrix();
  translate(q + 260,520);
  rotate(spin);
  rect(0,0,2,50);
  rect(0,0,50,2);
  rect(0,0,-50,2);
  rect(0,0,2,-50);
  popMatrix();
  spin = spin + 1.0;
  ///
  biker();
  //text("back: "+back, 200,200);
  //text("q: "+q, 200,220);
  //text("back + q: "+(back+q), 200, 240);
  //text("q+170: "+(q+170), 200,260);
  //text("q+190: "+(q+190), 200, 280);
  q = q - 3;
  if(q < -400){
    q = 2000;
    r =(int)(Math.random()*256);
    g =(int)(Math.random()*256);
    b =(int)(Math.random()*256);
    back = 180;
    backShift = -1; // < ====
    rightY = 470;// < == 
    move = -1;// < ==
  }

  if(back < 170){
    backShift = 1;
  }else if(back > 190){
    backShift = -1;
  }
  back = back + backShift;
   rightY = rightY + move;
  if(rightY < 450){
    move = 1;
  }
  if(rightY > 470){
    move = -1;
  }

  /////////// END BIKER ////////////////
  
  
  window();
  filler();
  fill(119,133,155);
  rect(50,550,750, 50);
  
  
  wingY = wingY + wing;
  if(wingY > 190){
    wing = -2;
  }
  if(wingY < 150){
    wing = 2;
  }
  
  wingYtwo = wingYtwo + wingTwo;
  if(wingYtwo > 190){
    wingTwo = -2;
  }
  if(wingYtwo < 150){
    wingTwo = 2;
  }
  
  wingX = wingX - 7;
  if(wingX < -300){
    wingX = 3000;
  }

  x = x - 5;
  dashx = dashx - 5;
  e = e - 5.25;
  if(dashx < -100){//110
    dashx = 800;
  }
  if(e < -800){//110
    e = 800;
  }
  if(x < -800){//110
    x = 800;
    //counter = counter+1;
    //if(counter%2 == 0){
      //counter = 0;
  //}
  }
}
void filler(){
  fill(119,133,155);
  rect(0,0,50,650);//left
  quad(570,50,800,50,800,550,750,550);//right
  //fill(3,3,12);
  fill(61, 61, 61);
  triangle(550,50,750,550,570,50);
  //fill(225,225,225);
  rect(50,50,510,15);
  
}
void window(){
  fill(129,175,249,70);
  quad(50,50,550,50,750,550,50,550);
  noStroke();
  //bezier(50,50,450,50,600,250,550,100);
}
void clouds(){
  fill(225,225,225);
  p = -100;
  ellipse(e+p-10,100+n,50,50);
  ellipse(e+30+p,90+n,70,70);
  ellipse(e+65+p,105+n,40,40);
  ellipse(e+85+p,112.5+n,25,25);
  rect(e+p-9,105+n,94,20);
  
  ellipse(e+750-10,100+n,50,50);
  ellipse(e+30+750,90+n,70,70);
  ellipse(e+65+750,105+n,40,40);
  ellipse(e+85+750,112.5+n,25,25);
  rect(e+750-9,105+n,94,20);
}
void trees(){
//TREE ONE
  fill(36,173,68);
  noStroke();
  //ellipse(x,150,100,100); //trees
  triangle(x,190,x-70,290,x+80,290); //x = 150 // 230,220
  triangle(x,230,x-80,350,x+90,350);
  triangle(x,290,x-80,410,x+90,410);
  //tree trunk
  fill(137, 92, 44);
  rect(x-20,410,50,50);
//TREE TWO
    fill(36,173,68);
    triangle(x+600,190,x+530,290,x+680,290);
    triangle(x+600,230,x+520,350,x+690,350);
    triangle(x+600,290,x+520,410,x+690,410);
    
  fill(137, 92, 44);
  //tree trunk 1
  rect(x-20,410,50,50);
  //tree trunk 2
      rect(x+580,410,50,50);
      rect(x+580,410,50,50);
}
void road(){
  fill(33, 32, 31);
  quad(50,480,722,480,750,550,50,550);
  fill(150, 255, 145);
  quad(50,450,722,450,750,480,50,480);
  //yellow dashes on the road
  fill(255, 238, 58);
  quad(dashx,510,dashx+40,510,dashx+35,516,dashx-5,516);
  quad(dashx+100,510,dashx+140,510,dashx+135,516,dashx+95,516);
  quad(dashx+200,510,dashx+240,510,dashx+235,516,dashx+195,516);
  quad(dashx+300,510,dashx+340,510,dashx+335,516,dashx+295,516);
  quad(dashx+400,510,dashx+440,510,dashx+435,516,dashx+395,516);
  quad(dashx+500,510,dashx+540,510,dashx+535,516,dashx+495,516);
  quad(dashx+600,510,dashx+640,510,dashx+635,516,dashx+595,516);
  quad(dashx+700,510,dashx+740,510,dashx+735,516,dashx+695,516);
  quad(dashx+800,510,dashx+840,510,dashx+835,516,dashx+795,516);
  //separate
  quad(dashx-100,510,dashx-60,510,dashx-65,516,dashx-105,516);
  quad(dashx-200,510,dashx-160,510,dashx-165,516,dashx-205,516);
  quad(dashx-300,510,dashx-260,510,dashx-265,516,dashx-305,516);
  quad(dashx-400,510,dashx-360,510,dashx-365,516,dashx-405,516);
  quad(dashx-500,510,dashx-460,510,dashx-465,516,dashx-505,516);
  quad(dashx-600,510,dashx-560,510,dashx-565,516,dashx-605,516);
  quad(dashx-700,510,dashx-660,510,dashx-665,516,dashx-705,516);
  quad(dashx-800,510,dashx-760,510,dashx-765,516,dashx-805,516);
}

void bird(){
  fill(0,0,0);
  //quad(300,150, 302,148, 319,170, 315,170);
  //quad(344,140, 346,142, 321,170, 316,170);
  quad(wingX+300,wingY, wingX+302,wingY-2, wingX+319,170, wingX+315,170);
  quad(wingX+344,wingYtwo-10, wingX+346,wingYtwo+2-10, wingX+321,170, wingX+316,170);
}



















//void setup()
//{
//  size(800,600);
//  frameRate(80);
//}
//void draw()
//{
//  background(119,133,155);
//  ///
//  //  recta();
//  pushMatrix();
//  //translate(width*0.2, height*0.5);
//  translate(q + 70,520);
//  //rotate(frameCount/5.0);
//  rotate(spin);
//  //polygon(0, 0, 50, 4);  // Triangle
//  fill(0,0,0,75);
//  rect(0,0,2,50);
//  rect(0,0,50,2);
//  rect(0,0,-50,2);
//  rect(0,0,2,-50);
//  //rect(0,0,5,100);
//  popMatrix();
//  // V cleaner V
//  pushMatrix();
//  translate(q + 260,520);
//  rotate(spin);
//  rect(0,0,2,50);
//  rect(0,0,50,2);
//  rect(0,0,-50,2);
//  rect(0,0,2,-50);
//  popMatrix();
//  spin = spin + 1.0;
//  ///
//  biker();
//  text("back: "+back, 200,200);
//  text("q: "+q, 200,220);
//  text("back + q: "+(back+q), 200, 240);
//  text("q+170: "+(q+170), 200,260);
//  text("q+190: "+(q+190), 200, 280);
//  q = q - 5;
//  if(q < -200){
//    q = 800;
//    r =(int)(Math.random()*256);
//    g =(int)(Math.random()*256);
//    b =(int)(Math.random()*256);
//    back = 190;
//  }

//  if(back < 170){
//    backShift = 1;
//  }else if(back > 190){
//    backShift = -1;
//  }
//  back = back + backShift;
//   rightY = rightY + move;
//  if(rightY < 450){
//    move = 1;
//  }
//  if(rightY > 470){
//    move = -1;
//  }
//}

void biker(){
  //Constant objects
  bike();
  //Not Constant
  movingLeg();
  //Constant objects
  shoe();
  torso();
  hands();
  head();
}
void movingLeg(){
  noStroke();
  //text(r+","+g+","+b,100,100);
  fill(r,g,b);
  quad(q+140,440,q+200,rightY,q+180,rightY+10,q+120,460);//445
  quad(q+180,rightY,q+200,rightY,q+back,rightY+50,q+back-20,rightY+50);
}

void shoe(){
  fill(0,0,0);
  beginShape();
  vertex(q-21+back,rightY+50);
  vertex(q+7+back,rightY+50);
  vertex(q+12+back,rightY+51);
  vertex(q+17+back,rightY+55);
  vertex(q+19+back,rightY+60);
  vertex(q+18+back,rightY+65);
  vertex(q+1.5-23+back,rightY+65);
  vertex(q-23+back,rightY+60);
  vertex(q-23+back,rightY+52);
  endShape(CLOSE);
}
void bike(){
  //Petal
  fill(111, 118, 130);
  beginShape();
  vertex(q-15+back,rightY+65);
  vertex(q+10+back,rightY+65);
  vertex(q+10+back,rightY+75);
  vertex(q-15+back,rightY+75);
  endShape(CLOSE);
  fill(0, 0, 0);
  ellipse(q-3.5+back,rightY+70,5,4.75);
  fill(86, 89, 94);
  ellipse(q-2.5+back,rightY+70,5,5);
  
  //Wheels
  //Front Wheel
  stroke(10);
  noFill();
  ellipse(q+260,520,100,100);
  ellipse(q+260,520,99,99);
  ellipse(q+260,520,98,98);
  ellipse(q+260,520,97,97);
  //Back Wheel
  ellipse(q+70,520,100,100);
  ellipse(q+70,520,99,99);
  ellipse(q+70,520,98,98);
  ellipse(q+70,520,97,97);
  noStroke();
  fill(76, 75, 75);
  ellipse(q+70,520,20,20);
  
  //Frame
  fill(0,0,0);
  beginShape();
  vertex(q+262,520);
  vertex(q+258,520);
  vertex(q+230.5,450);//detail
  vertex(q+230,450);//detail
  vertex(q+225,430);
  vertex(q+230,430);
  vertex(q+235,450);//detail
  vertex(q+235.5,450);//detail
  endShape(CLOSE);
  ellipse(q+260,520,2.5,2.5);
  
  //Main horizontal beam
  //fill(255,255,255);
  beginShape();
  vertex(q+231,450);//top right
  vertex(q+233,455);//bottom right
  vertex(q+130,475);//bottom left
  vertex(q+130,470);//top left
  endShape(CLOSE);
  
  //Bottom beam
  beginShape();
  vertex(q+235,450);//top right
  vertex(q+237,455);//bottom right
  vertex(q+145,540.5);//bottom left
  vertex(q+145,535);//top left
  endShape(CLOSE);
  
  //Left horizontal beam
  fill(0, 0, 0);
  ellipse(q+70,520,5,5);
  beginShape();
  vertex(q+69,518);//top left
  vertex(q+70,522);//bottom left
  vertex(q+145,540);//bottom right
  vertex(q+147,536);//top right
  endShape(CLOSE);
  
  //Left vertical beam
  fill(255,255,255);
  fill(0,0,0);
  beginShape();
  vertex(q+69,518);//top left
  vertex(q+70,522);//bottom right
  vertex(q+132,473);//bottom right (change)
  vertex(q+132,468);//top right (change)
  endShape(CLOSE);

  //Middle vertical beam / seat beam
  //fill(255,255,255);
  fill(0,0,0);
  beginShape();
  vertex(q+142.5,539);//bottom left
  vertex(q+145.5,534);//bottom right
  vertex(q+125,440);//top right
  vertex(q+120,436);//top left
  endShape(CLOSE);
  
  //Seat
  fill(76, 75, 75);
  beginShape();
  noStroke();
  vertex(q+110,458);//top left
  vertex(q+115,459);//dip
  vertex(q+145,461);//top right
  vertex(q+140,465);//bottom right
  vertex(q+116,466);//bump
  vertex(q+108,461);//bottom left
  endShape(CLOSE);
  
  //Handlebars
  noStroke();
  //fill(255,255,255);
  beginShape();
  vertex(q+225,430);//save
  vertex(q+230,430);//save
  vertex(q+240,425);
  vertex(q+245,430);
  vertex(q+250,430);
  vertex(q+235,405);
  vertex(q+230,405);
  vertex(q+237,420);
  vertex(q+227,425);
  vertex(q+225.5,426);//save
  endShape(CLOSE);
}
void torso(){
  fill(r,g,b);
  ellipse(q+125,440,40,40);
  fill(0,0,0);
  beginShape();
  vertex(q+105,435);
  vertex(q+105,433);//detail
  vertex(q+145,360);//lean of back
  vertex(q+180,360);//lean of back
  vertex(q+145,440);
  endShape(CLOSE);
  //Arms
  fill(255,255,255);
  beginShape();
  vertex(q+245,430);
  vertex(q+250,420);
  vertex(q+200,390);//elbow
  vertex(q+180,360);
  vertex(q+160,370);
  vertex(q+185,400);//elbow
  endShape(CLOSE);
}
void hands(){
  fill(247,206,190);
  ellipse(q+245,425,20,20);
  }
  
void head(){
  fill(247,206,190);
  //neck
  rect(q+155.5,350,17,10);
  //head
  beginShape();
  vertex(q+155,355);//btm left
  vertex(q+183,353);//btm right
  vertex(q+184,350);//chin
  vertex(q+185,340);//under nose
  vertex(q+190,340);//tip of nose
  vertex(q+185,325);//top of nose
  vertex(q+183,310);//top right
  vertex(q+160,310);//top left
  vertex(q+152,330);
  endShape(CLOSE);
  //Hair
  fill(0,0,0);
  beginShape();
  vertex(q+184,315);
  vertex(q+183,310);
  vertex(q+182,308);//top right
  vertex(q+160,309);//top left
  vertex(q+155,318);
  vertex(q+151,320);
  vertex(q+152,330);//bottom left
  vertex(q+150,340);
  vertex(q+155,345);//bottom right
  vertex(q+160,330);//inside corner
  vertex(q+167,328);
  vertex(q+168,337.5);
  vertex(q+172,337.5);
  vertex(q+173,320);
  vertex(q+174,318);
  endShape(CLOSE);
}
