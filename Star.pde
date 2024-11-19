class Star {
  private float myX, myY, mySize;
  private color myColor;
  public Star() {
    myX = (float)Math.random()*600;
    myY = (float)Math.random()*600;
    mySize = (float)Math.random()*2+1;
    myColor = color(255, 255, 255, 200);
  }
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
  }
}
