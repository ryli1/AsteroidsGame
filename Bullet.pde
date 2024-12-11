class Bullet extends Floater {
  protected boolean isLaser = false;
  public Bullet(Spaceship ship) {
    myPointDirection = ship.getDirection();
    double dRadians = myPointDirection*(Math.PI/180);     
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myColor = color(255, 255, 255);
    myXspeed = 5.5*Math.cos(dRadians);
    myYspeed = 5.5*Math.sin(dRadians);
  }
  public void show () { //Draws the floater at the current position  
    fill(myColor);   
    ellipse((float)myCenterX, (float)myCenterY, 4, 4);
  }
  public boolean getLaser() {
    return isLaser; 
  }
}

class Laser extends Bullet {
   public Laser(Spaceship ship) {
     super(ship);
     isLaser = true;
     myColor = color(255, 0, 0);
   }
   public void show () {
     stroke(myColor);
     strokeWeight(1);
     myXspeed *= 2;
     myYspeed *= 2;
     line((float)myCenterX, (float)myCenterY, (float)(myXspeed*10+myCenterX), (float)(myYspeed*10+myCenterY));
   }
}
