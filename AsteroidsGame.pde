//add more asteroids when there's none left

boolean gameIsStarted = true;

Spaceship ship = new Spaceship();

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> shots = new ArrayList<Bullet>();

int numAsteroids = 13;
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();

Bar healthBar = new Bar();
Bar ammoBar = new Bar();

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
    for (int s = 0; s < stars.length; s++) {
      stars[s].show();
      stars[s].blink();
    }
    for (int s = 0; s < shots.size(); s++) {
      shots.get(s).show();
      shots.get(s).move();
    }
    for (int a = 0; a < asteroids.size(); a++) {
      asteroids.get(a).show();
      asteroids.get(a).move();
    }
    //bullet collision
    for (int i = shots.size()-1; i >= 0; i--) {
      for (int j = asteroids.size()-1; j >= 0; j--) {
        float distance = dist((float)shots.get(i).getX(), (float)shots.get(i).getY(), (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY());
        if (distance < 12 * asteroids.get(j).getSize()) {
          if (asteroids.get(j).getSize() > 2.5) {
            shots.remove(i);
            asteroids.get(j).splits(asteroids);
          } else {
            asteroids.remove(j);
            shots.remove(i);
          }
          break;
        }
      }
    }
    //ship collision
    for (int i = asteroids.size()-1; i >= 0; i--) {
      float distance = dist((float)ship.getX(), (float)ship.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY());
      if (distance < 13 * asteroids.get(i).getSize()) {
        if (asteroids.get(i).getSize() > 2.5) {
          asteroids.get(i).splits(asteroids);
        } else {
          asteroids.remove(i);
        }
        healthBar.update(-15);
        break;
      }
    }
    ship.show();
    ship.move();
    if (healthBar.getLength() <= 0) {
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
  healthBar.show(30, 630, 15);
  ammoBar.show(30, 660, 10);
  if(frameCount % 80 == 0 && ammoBar.getLength() < 150) {
    ammoBar.update(10);
    if(ammoBar.getLength() > 150) {
      ammoBar.setLength(150); 
    }
  }
  if(frameCount % 200 == 0) {
    while(asteroids.size() < 12) {
      asteroids.add(new Asteroid()); 
    }
  }
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
  if (key == ' ' && ammoBar.getLength() > 0) {
    shots.add(0, new Bullet(ship)); 
    ammoBar.update(-5);
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
