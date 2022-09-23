int currentTime;
int previousTime;
int deltaTime;

vaisseau v;










void setup(){
   size (800, 600);
currentTime = millis();
  previousTime = millis();
   v = new vaisseau();
   v.location.x = width / 2;
  v.location.y = height / 2;
  
  
  
  
}
void draw(){
 currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;







  update(deltaTime);
  display();
  
}


void update(int delta) {
  if (keyPressed) {
    switch (key) {
      case 'w':
        v.thrust();
        break;
      case CODED:
        if (keyCode == LEFT) v.pivote(-.03);
        if (keyCode == RIGHT) v.pivote(.03);
        break;
    }



void display () {
  background(0);
  
  v.display();
}
