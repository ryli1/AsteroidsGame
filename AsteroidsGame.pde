//MAKE ASTEROIDS SHRINK. MAKE ACCELERATION DECELERATE A LITTLE

boolean gameIsStarted = true;

Spaceship ship = new Spaceship();

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> shots = new ArrayList<Bullet>();

int numAsteroids = 15;
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();

Health healthBar = new Health();

public void setup() {
  size(700, 700);
  background(0);
  frameRate(80);
  ship.setCenterX(width/2);
  ship.setCenterY(height/2);
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
  if (gameIsStarted == false) {
    background(0);
  }
  if (gameIsStarted == true) {
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
    //bullet collision
    for (int i = shots.size()-1; i >= 0; i--) {
      for (int j = asteroids.size()-1; j >= 0; j--) {
        float distance = dist((float)shots.get(i).getX(), (float)shots.get(i).getY(), (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY());
        if (distance < 12 * asteroids.get(j).getSize()) {
          asteroids.set(j, new Asteroid()); //replace destroyed asteroid with new
          int ranNum = (int)(Math.random()*2);
          if (ranNum == 0) {
            asteroids.get(j).setCenterX((int)(Math.random()*-300)+100);
            asteroids.get(j).setCenterY((int)(Math.random()*-300)+100);
          } else {
            asteroids.get(j).setCenterX((int)(Math.random()*width)+900);
            asteroids.get(j).setCenterY((int)(Math.random()*height)+900);
          }
          shots.remove(i);
          break;
        }
      }
    }
    //ship collision
    for (int i = asteroids.size()-1; i >= 0; i--) {
      float distance = dist((float)ship.getX(), (float)ship.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY());
      if (distance < 13 * asteroids.get(i).getSize()) {
        asteroids.set(i, new Asteroid());
        int ranNum = (int)(Math.random()*2);
        if (ranNum == 0) {
          asteroids.get(i).setCenterX((int)(Math.random()*-300));
          asteroids.get(i).setCenterY((int)(Math.random()*-300));
        } else {
          asteroids.get(i).setCenterX((int)(Math.random()*width)+800);
          asteroids.get(i).setCenterY((int)(Math.random()*height)+800);
        }
        healthBar.update();
      }
    }
    ship.show();
    ship.move();
    if (healthBar.getHealth() <= 0) {
      gameIsStarted = false;
    }
    if (wPressed == true) {
      ship.accelerate(0.05);
    }  
    if (sPressed == true) {
      ship.accelerate(-0.05);
    }  
    if (aPressed == true) {
      ship.turn(-3);
    }  
    if (dPressed == true) {
      ship.turn(3);
    }
  }
  healthBar.show();
}

boolean wPressed, sPressed, aPressed, dPressed = false;

public void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  } else if (key == 's') {
    sPressed = true;
  } else if (key == 'a') {
    aPressed = true;
  } else if (key == 'd') {
    dPressed = true;
  }
}

public void keyReleased() {
  if (key == ' ') {
    shots.add(0, new Bullet(ship)); 
    if (shots.size() > 100) 
      shots.remove(shots.size()-1);
  } else if (key == 'f') {
    ship.hyperspace();
  } else if (key == 'w') {
    wPressed = false;
  } else if (key == 's') {
    sPressed = false;
  } else if (key == 'a') {
    aPressed = false;
  } else if (key == 'd') {
    dPressed = false;
  } 
}
