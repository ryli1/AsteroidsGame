//Encapsulate everything

Spaceship ship = new Spaceship();

Spaceship[] fleet = new Spaceship[5];

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> bullets = new ArrayList <Bullet>();

public void setup() {
  size(600, 600);
  background(0);
  frameRate(100);
  ship.setCenterX(300);
  ship.setCenterY(300);
  for(int i = 0; i < fleet.length; i++) {
    fleet[i] = new Spaceship(i); 
  }
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star(); 
  }
}

public void draw() {
  background(0);
  for(Star s : stars) {
    s.show();
    s.blink();
  }
  for(Bullet b : bullets) {
    b.show();
    b.move();
  }
  /*for(Spaceship s : fleet) {
    s.show();
    s.move();
  }*/
  ship.show();
  ship.move();
}

public void keyPressed() {
  if(key == ' ') {
    bullets.add(new Bullet(ship)); 
  }
  if(key == 'f') {
    ship.hyperspace(); 
  }
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

}
