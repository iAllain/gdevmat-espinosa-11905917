Walker[] Walker = new Walker[10];
void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  createWalker();
}

void draw()
{
  background(80);
  
  for (int i = 0; i < 10; i++)
  {
    Walker[i].update();
    Walker[i].render();
    
    for (int j = 0; j < 10; j++)
    {
      if (i != j)
      {
        Walker[i].applyForce(Walker[j].calculateAttraction(Walker[i]));
        Walker[j].applyForce(Walker[i].calculateAttraction(Walker[j]));
      }
    }
  }
  //big.update();
  //big.render();
  
  //small.update();
  //small.render();
  
  //small.applyForce(big.calculateAttraction(small));
  //big.applyForce(small.calculateAttraction(big));
}

void createWalker()
{
  for (int i = 0; i < 10; i++)
  {
    noStroke();
    float scale = int(random(10));
    int randomRGB = int(random(1, 255));
    int randomAlpha = 60 + int(random(91));
    int randomPosition = int(random(-100,100));
    int randomMass = 1 + int(random(20));
    
    Walker walker = new Walker();
    walker.position.x = randomPosition;
    walker.position.y = randomPosition;
    walker.mass = randomMass;
    walker.scale = scale * walker.mass;
    walker.setColor(255,randomRGB, 125, randomAlpha);
    
    Walker[i] = walker;
  }
}
