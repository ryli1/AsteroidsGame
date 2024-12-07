class Asteroid extends Floater {
  private double rotSpeed;
  private int randomN;
  private float randomSize;
  private int numAsteroidTypes = 3; 
  public Asteroid() {
    myColor = color(255);
    myXspeed = (Math.random()*3)-1; 
    myYspeed = (Math.random()*3)-1;
    if(myXspeed == 0) {
      myXspeed++;
    }
    if(myYspeed == 0) {
      myYspeed++;
    }
    rotSpeed = Math.random()*4;
    randomN = (int)(Math.random()*numAsteroidTypes);
    randomSize = (float)(Math.random()*3)+1;
    if(randomN == 0) {
      corners = 6;
      xCorners = new int[]{-11, 7, 13, 6, -16, -5};
      yCorners = new int[]{-8, -8, 0, 10, 4, 0};
    }
    else if(randomN == 1) {
      corners = 10;
      xCorners = new int[]{-11, -11, -4, -3, 6, 8, 8, -2, -8, -8};
      yCorners = new int[]{3, -3, -4, -8, -6, 0, 6, 10, 10, 3};
    }
    else if(randomN == 2) {
      corners = 10;
      xCorners = new int[]{7, 2, 0, -13, -16, -11, 5, 7, 13, 13};
      yCorners = new int[]{13, 12, 13, 8, 2, -8,-12, -8, 0, 10};
    }
    for(int i = 0; i < corners; i++) {
      //change size of the asteroids
      xCorners[i] *= randomSize;
      yCorners[i] *= randomSize;
    }
  }
  public void move() {
    turn(rotSpeed);
    super.move();
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
    noFill();
    super.show();
  }
  public float getSize() {
    return randomSize; 
  }
}
