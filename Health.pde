class Health {
  private float greenHealth, redHealth;
  public Health() {
    greenHealth = 150;
    redHealth = 150;
  }
 
  public void show() {
    fill(#E80C0C);
    strokeWeight(2);
    rect(30, 650, redHealth, 15);
    fill(255);
    //fill(#21D606);
    noStroke();
    rect(30, 650, greenHealth, 15);
  }
  
  public void update() {
    greenHealth -= 10;
    if(greenHealth <= 0) {
      greenHealth = 0;
    }
  }
  public float getHealth() {
    return greenHealth; 
  }
}
