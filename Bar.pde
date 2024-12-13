class Bar {
  private float greenHealth, redHealth;
  public Bar() {
    greenHealth = 150;
    redHealth = 150;
  }
  public void show(int x, int y, int h) {
    fill(0);
    strokeWeight(2);
    stroke(255);
    rect(x, y, redHealth, h);
    fill(255);
    //fill(#21D606);
    noStroke();
    rect(x, y, greenHealth, h);
  }
  public void update(int n) {
    greenHealth += n;
    if (greenHealth <= 0) {
      greenHealth = 0;
    }
  }
  public float getLength() {
    return greenHealth;
  }
  public void setLength(int x) {
    greenHealth = x;  
  }
}
