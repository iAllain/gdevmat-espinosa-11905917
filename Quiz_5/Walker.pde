class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5,10);
 
  void moveAndBounce()
  {
    position.add(speed);
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
  
  void render ()
  {
    color red = color (255,0,0);
    fill(red);
    circle(position.x,position.y,50);
  }
}
