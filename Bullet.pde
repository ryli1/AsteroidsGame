class Bullet extends Floater {
  public Bullet(Spaceship ship) {
    myPointDirection = ship.getDirection();
    double dRadians = myPointDirection*(Math.PI/180);     
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myColor = color(255, 255, 255);
    myXspeed = 5*Math.cos(dRadians);
    myYspeed = 5*Math.sin(dRadians);
  }
  public void show () { //Draws the floater at the current position  
    fill(myColor);   
    ellipse((float)myCenterX, (float)myCenterY, 4, 4);
  }
}
