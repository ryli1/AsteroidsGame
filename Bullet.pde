class Bullet extends Floater {
  public Bullet(Spaceship aShip) {
    myPointDirection = aShip.getDirection();  
    myCenterX = aShip.getX();
    myCenterY = aShip.getY();
    myColor = color(#00E3FF);
  }
  public void show () { //Draws the floater at the current position  
    fill(myColor);   
    ellipse((float)myCenterX, (float)myCenterY, 3, 3);
  }
}
