public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector(0.2,0);
  

  public float r = 225, g = 0, b = 255, a = 255;
  public float velocityLimit = 100;
  public float scale = 15;
  public float mass = 5;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulate
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration); 
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    noStroke();
    fill(r,g,b,a);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x >= Window.right)
    {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
    if (this.position.y <= Window.bottom)
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
  
  public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
