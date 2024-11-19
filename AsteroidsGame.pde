//Encapsulate everything

Spaceship ship = new Spaceship();
Star[] stars = new Star[500];

public void setup() {
  size(600, 600);
  background(0);
  ship.setCenterX(300);
  ship.setCenterY(300);
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star(); 
  }
}
public void draw() {
  background(0);
  for(Star i : stars) {
    i.show();
  }
  ship.show();
  ship.move();
}

public void keyPressed() {
  if(key == 'w') {
    ship.accelerate(0.1); 
  }
  if(key == 's') {
    ship.accelerate(-0.1); 
  }
  if(key == 'a') {
    ship.turn(-6); 
  }
  if(key == 'd') {
    ship.turn(6); 
  }
  if(key == 'f') {
    ship.hyperspace(); 
  }
}
