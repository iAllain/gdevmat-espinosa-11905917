int screen = 0;

void setup()
{
  size (1280, 720, P3D);
  camera (0,0, -(height/2.0)/ tan(PI*30.0/180.0), 0,0,0,0,-1,0);
  background(255);
}

void draw()
{
  float gaussian = randomGaussian();
  float standardDeviation = 100; // range of cluster
  float mean = 0; // center of the line
  
  float x = standardDeviation * gaussian + mean;
  int y = int(random(-360, 360));
  
  noStroke();
  float scaleGaussian = randomGaussian();
  float scaleSTD = 100;
  float scaleMean = 1;  
  float scale = scaleSTD * scaleGaussian + scaleMean;
  
  int randomRGB = int(random(256));
  int randomAlpha = 10 + int(random(91));
  color random = color (randomRGB, 0, randomRGB, randomAlpha);
  
  fill(random);
  circle(x,y,scale);
  
  screen++;
  if (screen == 300)
  {
    background(255);
    screen = 0;
  }
}
