Liquid water = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] Walker = new Walker[10];
PVector wind = new PVector(0.1,0);
int posX = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  createWalker();
}

void draw()
{
  background(0);
    
  water.render();
  
  for (int i = 0; i < 10; i++)
  {
    Walker[i].render();
    Walker[i].update();
  
    PVector gravity = new PVector (0, -0.15f * Walker[i].mass);
    Walker[i].applyForce(wind);
    Walker[i].applyForce(gravity);
  
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = Walker[i].velocity.copy();
    Walker[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
  
    if (Walker[i].position.y <= Window.bottom)
    {
      Walker[i].position.y = Window.bottom;
      Walker[i].velocity.y *= -1;
    }
  
    if (water.isCollidingWith(Walker[i]))
    {
      PVector dragForce = water.calculateDragForce(Walker[i]);
      Walker[i].applyForce(dragForce);
    }
    Walker[i].checkEdges();
  }
}

void createWalker()
{
  for (int i = 0; i < 10; i++)
    { 
      posX = 2 * (Window.windowWidth / 10) * (i - 5);
      int randomRGB = int(random(1, 255));
      Walker walker = new Walker();
      walker.position = new PVector(posX, 300);
      walker.mass = 5 + (i);
      walker.scale = walker.mass * 5;
      walker.setColor(255,randomRGB, 50, 255);
      
      Walker[i] = walker;
    }
}
