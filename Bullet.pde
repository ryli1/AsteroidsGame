class Bullet extends Floater {
  double dRadians;
  public Bullet(Spaceship ship) {
    myPointDirection = ship.getDirection();
    dRadians = myPointDirection*(Math.PI/180);     
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myColor = color(#00E3FF);
    myXspeed = 3*Math.cos(dRadians);
    myYspeed = 3*Math.sin(dRadians);
  }
  public void show () { //Draws the floater at the current position  
    fill(myColor);   
    ellipse((float)myCenterX, (float)myCenterY, 3, 3);
  }
}

