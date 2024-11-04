Particle []bob= new Particle[100];
//your code here
void setup()
{
  //your code here
  background(0);
  size(800, 800);
  for (int i=0; i<bob.length; i++)
  if(i==0){
    bob[i]= new OddballParticle();
  }else{
    bob[i] = new Particle();
  }
}
void draw()
{
  background(0);
  //your code here
  for (int i = 1; i<bob.length; i++) {
    bob[i].show();
    bob[i].move();
    
    if (bob[i].x<0) {
      bob[i]=new Particle();
    }
    if (bob[i].y <0) {
      bob[i]=new Particle();
    }
    if (bob[i].x>800) {
      bob[i]=new Particle();
    }
    if (bob[i].y>800) {
      bob[i]=new Particle();
    }  
   }
   for (int i = 0; i<1; i++) {
      bob[i].show();
      bob[i].move();
      
    if (bob[i].x<0) {
      bob[i]=new OddballParticle();
    }
    if (bob[i].y <0) {
      bob[i]=new OddballParticle();
    }
    if (bob[i].x>800) {
      bob[i]=new OddballParticle();
    }
    if (bob[i].y>800) {
      bob[i]=new OddballParticle();
    }  
   }
}



class Particle
{
  //your code here
  double x, y, speed, xangle,yangle;
  int myColor;
  float size;
  Particle() {
    size=5;
    xangle = Math.random()*2*Math.PI;
    yangle = xangle;
    x= width/2 + Math.cos(xangle)*25;
    y= height/2 + Math.cos(yangle)*25;
    speed = Math.random()*2+1;
    myColor = color(255, 255, 255 );
  }

  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)x, (float)y, size, size);
  }
  void move() {
    x= x+ speed*(Math.cos(xangle));
    y= y+ speed*(Math.sin(yangle));
    speed=speed+0.0001;
    //size = size+(float)speed*0.01;
    size = size+(float)speed*0.03;
    /*
    if (x<0) {
      x= width/2;
      y= height/2;
      size=5;
      angle = Math.random()*2*Math.PI;

    }
    if (y<0) {
      x= width/2;
      y= height/2;
      size=5;
      angle = Math.random()*2*Math.PI;
    }
    if (x>800) {
      x= width/2;
      y= height/2;
      size=5;
    }
    if (y>800) {
      x= width/2;
      y= height/2;
      size=5;
    }
    */
  }
}

class OddballParticle extends Particle { //inherits from Particle

  //your code here
  OddballParticle() {
    size=100;
    x= width/2;
    y= height/2;
    speed = Math.random()*4+1;
    xangle = Math.random()*2*Math.PI;
    yangle=xangle;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256) );
  }
  
  void move() {    
    xangle+=Math.PI/100;
    x= x+ speed*(Math.cos(xangle))+speed*Math.cos(xangle);
    yangle+=Math.PI/500;
    y= y+ speed*(Math.sin(yangle));
    speed=speed+0.001;
    //size = size+(float)speed*0.01;
    size = size+(float)speed*0.03;
  }
}
