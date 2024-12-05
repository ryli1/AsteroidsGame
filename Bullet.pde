class Bullet extends Floater {
  public Bullet(Spaceship aShip) {
    myPointDirection = aShip.getDirection();
    double dRadians = myPointDirection*(Math.PI/180);     
    myCenterX = aShip.getX();
    myCenterY = aShip.getY();
    myColor = color(#FF0505);
    myXspeed = 4*Math.cos(dRadians);
    myYspeed = 4*Math.sin(dRadians);
  }
  public void show () { //Draws the floater at the current position  
    fill(myColor);   
    ellipse((float)myCenterX, (float)myCenterY, 4, 4);
  }
}

