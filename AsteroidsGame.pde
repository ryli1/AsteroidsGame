//FIX BULLETS, MAKE ASTEROIDS SHRINK. MAKE ACCELERATION DECELERATE A LITTLE

Spaceship ship = new Spaceship();

Spaceship[] fleet = new Spaceship[5];

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> shots;

int numAsteroids = 8;
//ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
Asteroid[] asteroidz = new Asteroid[10];

public void setup() {
  shots = new ArrayList <Bullet>();
  size(700, 700);
  background(0);
  frameRate(80);
  ship.setCenterX(width/2);
  ship.setCenterY(height/2);
  /*for(int i = 0; i < fleet.length; i++) {
    fleet[i] = new Spaceship(i); 
  }*/
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star(); 
  }
  for(int i = 0; i < asteroidz.length; i++) {
    asteroidz[i] = new Asteroid();
  }
  /*for(int i = 0; i < numAsteroids; i++) {
    asteroids.add(new Asteroid());
    asteroids.get(i).setCenterX((int)(Math.random()*width));
    asteroids.get(i).setCenterY((int)(Math.random()*height));

  }*/
}
Asteroid newthing = new Asteroid();

public void draw() {
  background(0);
  for(Star s : stars) {
    s.show();
    s.blink();
  }
  for(Bullet b : shots) {
    b.show();
    b.move();
  }
  for(Asteroid a : asteroids) {
    a.show();
    a.move();
  }
  for(Asteroid a : asteroidz) {
    a.show();
    a.move();
  }
  ship.show();
  ship.move();
}

public void keyPressed() {
  if(key == 'q') {
    shots.add(0, new Bullet(ship)); 
    if(shots.size() > 50) 
    shots.remove(shots.size()-1);
  }
  else if(key == 'f') {
    ship.hyperspace(); 
  }
  else if(key == 'w') {
    ship.accelerate(0.15); 
  }
  else if(key == 's') {
    ship.accelerate(-0.15); 
  }
  else if(key == 'a') {
    ship.turn(-6); 
  }
  else if(key == 'd') {
    ship.turn(6); 
  }

}
