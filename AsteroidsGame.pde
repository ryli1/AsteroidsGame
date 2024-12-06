//ADD SHIP COLLISION, MAKE ASTEROIDS SHRINK. MAKE ACCELERATION DECELERATE A LITTLE
//MAKE COLLISION DISTANCE DYNAMICALLY CHANGE WITH ASTEROID SIZE
//ADD ONE MORE ASTEROID TYPE

Spaceship ship = new Spaceship();

Spaceship[] fleet = new Spaceship[5];

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> shots = new ArrayList<Bullet>();

int numAsteroids = 15;
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();

public void setup() {
  size(700, 700);
  background(0);
  frameRate(80);
  ship.setCenterX(width/2);
  ship.setCenterY(height/2);
  /*for(int i = 0; i < fleet.length; i++) {
   fleet[i] = new Spaceship(i); 
   }*/
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < numAsteroids; i++) {
    asteroids.add(new Asteroid());
    asteroids.get(i).setCenterX((int)(Math.random()*width));
    asteroids.get(i).setCenterY((int)(Math.random()*height));
  }
}

public void draw() {
  System.out.println(asteroids.size());
  background(0);
  for (Star s : stars) {
    s.show();
    s.blink();
  }
  for (Bullet b : shots) {
    b.show();
    b.move();
  }
  for (Asteroid a : asteroids) {
    a.show();
    a.move();
  }
  for (int i = 0; i < shots.size(); i++) {
    for (int j = 0; j < asteroids.size(); j++) {
      float distance = dist((float)shots.get(i).getX(), (float)shots.get(i).getY(), (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY());
      if (distance < 20) {
        asteroids.set(j, new Asteroid());
        shots.remove(i);
        break;
      }
    }
  }
  for (int i = 0; i < asteroids.size(); i++) {
    float distance = dist((float)ship.getX(), (float)ship.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY());
    if (distance < 20) {
      asteroids.set(i, new Asteroid());
    }
  }
  ship.show();
  ship.move();
}

public void keyPressed() {
  if (key == 'q') {
    shots.add(0, new Bullet(ship)); 
    if (shots.size() > 100) 
      shots.remove(shots.size()-1);
  } else if (key == 'f') {
    ship.hyperspace();
  } else if (key == 'w') {
    ship.accelerate(0.15);
  } else if (key == 's') {
    ship.accelerate(-0.15);
  } else if (key == 'a') {
    ship.turn(-6);
  } else if (key == 'd') {
    ship.turn(6);
  }
}
