PVector gravity = new PVector (0, -0.4);
PVector wind = new PVector (0.15,0);
Walker[] Walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  createWalker();
}

void draw()
{
  background(0);
  for (int i = 0; i < 10; i++)
  {
    Walker[i].render();
    Walker[i].update();
    Walker[i].applyForce(wind);
    Walker[i].applyForce(gravity);
    Walker[i].checkEdges();
  }
}

void createWalker()
{
  for (int i = 0; i < 10; i++)
    { 
      int randomRGB = int(random(1, 255));
      Walker walker = new Walker();
      walker.position.x = -500;
      walker.position.y = 200;
      walker.mass = random(1,10);
      walker.scale = walker.mass * 15;
      walker.setColor(255,randomRGB, 50, 255);
      
      Walker[i] = walker;
    }
}
