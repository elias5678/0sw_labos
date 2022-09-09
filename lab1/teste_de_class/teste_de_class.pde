
Liquid liquid;
int nbball = 50;
ball[] balls;
ball ba;
boolean b=false;
void setup() {

  ba =new ball(random(0.1, 7), 200, 300);
  balls = new ball[nbball];


  liquid = new Liquid(0, random(0.1*height,0.4*height), width, height , 0.2);
  size (800, 600);

  for (int i = 0; i     < balls.length; i++) {
    balls[i] = new ball(random(0.1, 7), 400, 0);
  }
}





void draw () {
  background(255);
  update();
}
void update() {


 


  float m_el = ba.mass;

  PVector gravity_el = new PVector (0, random (-0.138* m_el));
  ba.applyForce(gravity_el);
  ba.update();
  ba.checkEdges();

  for (int i = 0; i < balls.length; i++) {


    if (mouseButton == LEFT) {
      PVector wind = new PVector(0.5, 0);
      balls[i].applyForce(wind);
      ba.applyForce(wind);
    } else if (mouseButton == RIGHT) {
      PVector wind = new PVector(-0.5, 0);
      balls[i].applyForce(wind);
      ba.applyForce(wind);
    }



    float m = balls[i].mass;

    PVector gravity = new PVector (0, random (0.1* m));



    //float c = 0.9;
    //PVector friction = balls[i].velocity.get();
    //friction.mult(-1);
    //friction.normalize();
    //friction.mult(c);
    // balls[i].applyForce(friction);



if (keyPressed) {
  
  if((key == 'r')){
   setup();
  }
  
    if (key == ' ') {
       
     if (balls[i].isInside(liquid)) {
      liquid.display();
      balls[i].drag(liquid);
      b=!b;
    }
  
   
    }
 
 
}

    balls[i].applyForce(gravity);
    balls[i].update();
    balls[i].checkEdges();
  }
   for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
  ba.display();
 
}
