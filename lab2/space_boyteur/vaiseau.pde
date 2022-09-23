class vaisseau{
   PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angularVelocity = 0.0;
  float angularAcceleration = 0.0;
  
  float angle = 0.0;  
  float heading = 0.0;
  
  float w = 20;
  float h = 10;
  
  float mass = 1.0;
  
  float speedLimit = 5;
  boolean thrusting = false;
  
 void  Vaisseau() {
       location = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
  }
   void applyForce (PVector force) {
    PVector f;
    
    if (mass != 1)
      f = PVector.div (force, mass);
    else
      f = force;
   
    this.acceleration.add(f);
  }
  void checkEdges() {
    if (location.x < -size) location.x = width + size;
    if (location.y < -size) location.y = height + size;
    if (location.x > width + size) location.x = -size;
    if (location.y > height + size) location.y = -size;
  }
   void thrust(){
    float angle = heading - PI/2;
   PVector force = new PVector (cos(angle), sin(angle));
    force.mult(0.1);
    
    applyForce(force);
    
    thrusting = true;    
  }
  
  
  
  
  
  
  
  
    void pivote(float angle) {
    heading += angle;
  }
  
  void noThrust() {
    thrusting = false;
  }
  
  }
