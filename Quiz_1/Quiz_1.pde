void setup() // 
{
  size (1280, 720, P3D); // 
  camera(0, 0, -(height/2.0) / tan (PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); 
  background(20);
}

void draw()
{
  drawCartesianPlane();
  drawLinearFunc();
  drawQuadraticFunc();
  drawCircle();
  drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color silver = color(211,211,211);
  fill(silver);
  stroke(silver);
  line(300, 0, -300, 0);
  line(0, 300, 0, -300);
  
  for (int i = -300; i <= 300; i += 25)
  {
    line(i, -10, i, 10);
    line(-10, i, 10, i);
  }
}

void drawLinearFunc()
{
  color purple = color(128,0,128);
  fill(purple);
  stroke(purple);
  
  for (int x = -300; x <= 300; x++)
  {
    circle(x, (-x * 5) + 30, 5);
  }
}

void drawQuadraticFunc()
{
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, (float)Math.pow(x,2) - (x * 15) -3, 5);
  }
}

void drawCircle()
{
  color red = color (255,0,0);
  fill(red);
  stroke(red);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x)*radius, ((float)Math.sin(x)*radius), 5);
  }
}

void drawSineWave()
{
  color blue = color(0,0,255);
  fill(blue);
  stroke(blue);
  
  float amplitude = 90;
  float frequency = 90;
  
  for (int x = 0; x >= 360; x++)
  {
    circle((float)Math.cos(x)*amplitude,((float)Math.sin(x)*frequency),5);
  }
}
