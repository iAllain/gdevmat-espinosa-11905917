public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float r = 225, g = 0, b = 255, a = 255;
  public float velocityLimit = 10;
  public float scale = 25;
  
  public Walker()
  {
    
  }
  
  public void update()
  {
    this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    fill(r,g,b,a);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
  {
    this.position.x = Window.right;
  }
  if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
  {
    this.position.y = Window.top;
  }
  }
}
