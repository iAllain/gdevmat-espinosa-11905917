Mover[] otherMatter = new Mover[100];
Mover blackHole = new Mover();
int blackHolePresent = 0;

void setup()
{
  background(0);
  camera (0,0, Window.eyeZ, 0,0,0,0,-1,0);
  size (1280, 720, P3D);
  createOtherMatter();
}

void draw()
{  
  {
  background(0);
  if (blackHolePresent == 0)
  {
    createBlackHole();
    blackHolePresent = 1;
  } else
  {
    blackHole.render();
  }
  for (int i = 0; i < 100; i++)
   {
     otherMatter[i].render();
   }
  suckMatter();
  }
}

void createBlackHole()
{
  float randomPositionX = int(random(-640, 640));
  float randomPositionY = int(random(-360, 360));
  
  blackHole.position.x = randomPositionX;
  blackHole.position.y = randomPositionY;
  blackHole.scale = 50;
  blackHole.setColor(255,255,255,255);
  blackHole.render();
}

void createOtherMatter()
{ 
  for (int i = 0; i < 100; i++)
  {
  float gaussian = randomGaussian();
  float standardDeviation = 150; // range of cluster
  float mean = 0; // center of the line
    
  float x = standardDeviation * gaussian + mean;
  float y = int(random(-360, 360));
  
  noStroke();
  float scale = int(random(30,100));
  int randomRGB = int(random(1, 255));
  int randomAlpha = 10 + int(random(91));
  
  Mover dust = new Mover();
  dust.position.x = x;
  dust.position.y = y;
  dust.scale = scale;
  dust.setColor(255, randomRGB, 0, randomAlpha);
  
  otherMatter[i] = dust;  
  }
}

void suckMatter()
{
  PVector direction;
  for (int i = 0; i < 100; i++)
  {
  direction = PVector.sub(blackHole.position, otherMatter[i].position);
  direction.normalize().mult(10);
  otherMatter[i].position.add(direction);
  }
}
