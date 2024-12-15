boolean gameIsStarted = true;

Spaceship ship = new Spaceship();

int numStars = 1000;
Star[] stars = new Star[numStars];

ArrayList <Bullet> shots = new ArrayList<Bullet>();

int numAsteroids = 20;
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList <Asteroid> healthDrop = new ArrayList <Asteroid>();

int score = 0;

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
    fill(255);
    textSize(30);
    text("GAME OVER", 260, 320);
    textSize(15);
    text("Score: " + score, 310, 380);
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
          ammoBar.update(5);
          score += 100;
          break;
        }
      }
    }
    //ship collision
    for (int i = asteroids.size()-1; i >= 0; i--) {
      float distance = dist((float)ship.getX(), (float)ship.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY());
      if (distance < 13 * asteroids.get(i).getSize()) {
        healthBar.update(-15);
        if (asteroids.get(i).getSize() > 2.5) {
          asteroids.get(i).splits(asteroids);
        } else {
          asteroids.remove(i);
        }
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
    if (frameCount % 200 == 0) {
      while (asteroids.size() < 20) {
        asteroids.add(new Asteroid());
      }
    }
    if (ammoBar.getLength() > 150) {
      ammoBar.setLength(150);
    }
    healthBar.show(30, 630, 15);
    ammoBar.show(30, 660, 10);
    if (frameCount % 120 == 0 && ammoBar.getLength() < 150) {
      ammoBar.update(15);
    }
    if ((frameCount == 300 || frameCount % 1200 == 0) && healthDrop.size() < 1) {
      healthDrop.add(new Asteroid((int)(Math.random()*width)));
    }
    if (healthDrop.size() > 0) {
      healthDrop.get(0).show();
      healthDrop.get(0).move();
      float hpShipDistance = dist((float)ship.getX(), (float)ship.getY(), (float)healthDrop.get(0).getX(), (float)healthDrop.get(0).getY());
      for (int i = shots.size()-1; i >= 0; i--) {
        float hpBulletDistance = dist((float)shots.get(i).getX(), (float)shots.get(i).getY(), (float)healthDrop.get(0).getX(), (float)healthDrop.get(0).getY());
        if (hpBulletDistance < 20) {
          healthDrop.remove(0);
          healthBar.update(50);
          break;
        }
      }
      if (hpShipDistance < 25) {
        healthDrop.remove(0);
        healthBar.update(30);
      }
    }
    if (healthBar.getLength() > 150) {
      healthBar.setLength(150);
    }
    textSize(15);
    fill(255);
    text("Score: " + score, 30, 690);
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
