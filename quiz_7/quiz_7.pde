Walker[] Walker = new Walker[100];
void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  createWalker();
}

PVector mousePOS()
{
  float x = mouseX - Window.widthPx /2;
  float y = - (mouseY - Window.heightPx / 2);
  return new PVector(x,y);
}
void draw()
{
  background(0);
  PVector direction;
  
  for (int i = 0; i < 100; i++)
  {
    Walker[i].render();
    Walker[i].update();
    PVector destination = mousePOS();
    direction = PVector.sub(destination, Walker[i].position);
    direction.normalize();
    Walker[i].velocity.add(direction.mult(1)); 
  }
}

void createWalker()
{
  for (int i = 0; i < 100; i++)
  {
    float randomPositionX = int(random(-639,639));
    float randomPositionY = int(random(-359, 359));
    float scale = int(random(10,50));
    
    Walker walker = new Walker();
    walker.position.x = randomPositionX;
    walker.position.y = randomPositionY;
    walker.scale = scale;
    
    Walker[i] = walker;
  }
}

void followMouse()
{
  PVector direction;
  for (int i = 0; i < 100; i++)
  {
    PVector destination = mousePOS();
    direction = PVector.sub(destination, Walker[i].position);
    direction.normalize();
    Walker[i].velocity.add(direction.mult(1));
  }
}
