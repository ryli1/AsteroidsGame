class Spaceship extends Floater {
  public Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void hyperspace() {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = Math.random()*600;
    myCenterY = Math.random()*600;
  }
  public double getXspeed() {
    return myXspeed; 
  }
}
