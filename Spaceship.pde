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
  public Spaceship(int x) {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0 + (x*20);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void move () {  //move the floater in the current direction of travel     
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    //wrap around screen    
    if (myCenterX > width) {     
      myCenterX = 0;
    } else if (myCenterX<0) {     
      myCenterX = width;
    }    
    if (myCenterY > height) {    
      myCenterY = 0;
    } else if (myCenterY < 0) {     
      myCenterY = height;
    }
  }
  public void show() {
    fill(myColor);
    super.show();
  }
  public void hyperspace() {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myPointDirection = Math.random()*360;
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getXspeed() {
    return myXspeed; 
  }
  public double getYspeed() {
    return myYspeed; 
  }
  public double getDirection() {
    return myPointDirection; 
  }
}

