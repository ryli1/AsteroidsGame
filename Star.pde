class Star {
  private float myX, myY, mySize;
  private color myColor;
  private boolean blinks, isBlinking;
  public Star() {
    myX = (float)Math.random()*600;
    myY = (float)Math.random()*600;
    mySize = (float)Math.random()*2;
    myColor = color(255, 255, 255, (int)(Math.random()*100)+155);
    if ((int)(Math.random()*15) == 1) { //1/15 chance to be a blinking star
      blinks = true;
    }
  }
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
  }
  public void blink() {
    if (blinks == true) {
      if (isBlinking == false) {
        mySize -= 0.03;
        if (mySize <= 1) {
          isBlinking = true;
        }
      } else if (isBlinking == true) {
        mySize += 0.03;
        if (mySize >= 4) {
          isBlinking = false;
        }
      }
    }
  }
}
