class ball {
  PVector location;
  PVector velocity;
  PVector accelération;
  float mass;
  long dia;
  long couleur;
  float topSpeed;

  ball() {

    this.location = new PVector (random (width), random (height));
    this.velocity = new PVector (0, 0);
    this.accelération = new PVector (0, 0);

    this.mass = 1;
  }
  ball(PVector loc, PVector vel) {
    this.location = loc;
    this.velocity = vel;
    this.accelération = new PVector (0, 0);

    this.topSpeed = 100;
  }
  ball (float m, float x, float y) {
    mass = m;
    location = new PVector (x, y);

    velocity = new PVector(0, 0);
    accelération = new PVector(0, 0);
  }

  void update() {
    velocity.add (accelération);
    location.add (velocity);


    accelération.mult (0);
  }

  void display() {
    stroke (0);
    fill (127, 127, 127, 127);

    ellipse (location.x, location.y, mass * 16, mass * 16); // Dimension à l'échelle de la masse
  }
  boolean isInside(Liquid l) {

    if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
    {
      return true;
    } else {
      return false;
    }
  }

  void drag(Liquid l) {

    float speed = velocity.mag();

    float dragMagnitude = l.c * speed * speed;

    PVector drag = velocity.get();
    drag.mult(-1);

    drag.normalize();


    drag.mult(dragMagnitude);


    applyForce(drag);
  }


  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -0.9;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -0.9;
      location.y = 0;
    }
  }

  void applyForce (PVector force) {
    PVector f = PVector.div (force, mass);

    this.accelération.add(f);
  }
}
