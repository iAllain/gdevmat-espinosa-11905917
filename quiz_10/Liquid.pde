public class Liquid
{
  public float x,y;
  public float horizon, depth;
  public float cd; // coefficient of drag
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y =y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void render()
  {
    noStroke();
    fill (28, 120, 186);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  // walker contact with liquid
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon &&
    pos.x < this.x + this.horizon &&
    pos.y < this.y;
  }
  
   public PVector calculateDragForce(Walker walker)
  {
    // drag magnitude coe * drag sq
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    // direction -velocity
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    // scale = magnitude
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
}
