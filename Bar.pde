class Bar {
  private float greenHealth, redHealth;
  public Bar() {
    greenHealth = 150;
    redHealth = 150;
  }
  public void show(int x, int y) {
    fill(#E80C0C);
    strokeWeight(2);
    rect(x, y, redHealth, 15);
    fill(255);
    //fill(#21D606);
    noStroke();
    rect(x, y, greenHealth, 15);
  }
  public void update(int n) {
    greenHealth -= n;
    if (greenHealth <= 0) {
      greenHealth = 0;
    }
  }
  public float getHealth() {
    return greenHealth;
  }
}
