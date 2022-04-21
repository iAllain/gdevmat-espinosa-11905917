Walker[] Walker = new Walker[8];
int posY = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  createWalker();
}

void draw()
{
  background(0);
  drawLine();
  
  for (int i = 0; i < 8; i++)
    {
      float mew = 0; float normal = 1; 
      float frictionMagnitude = mew * normal;
      PVector friction = Walker[i].velocity.copy();
     
      Walker[i].acceleration = Walker[i].acceleration.mult(Walker[i].mass);
      Walker[i].applyForce(Walker[i].acceleration);
      if (Walker[i].position.x < 0)
      {
        mew = 0.01f;
        frictionMagnitude = mew * normal;
        friction.mult(-1);
        friction.normalize();
        friction.mult(frictionMagnitude);
        Walker[i].applyForce(friction);
     
      }
      else if (Walker[i].position.x > 0)
      {
        mew = 0.4f;
        frictionMagnitude = mew * normal;
        friction = Walker[i].velocity.copy(); // copy current velocity
        friction.mult(-1);
        friction.normalize();
        friction.mult(frictionMagnitude);
        Walker[i].applyForce(friction);
      }
    
    // PVector right = new PVector (0.05 * Walker[i].mass, 0);
     Walker[i].render();
     Walker[i].update();
    // Walker[i].applyForce(wind);
    //Walker[i].applyForce(right);
     Walker[i].checkEdges();
    } 
}

void createWalker()
{
  for (int i = 0; i < 8; i++)
    { 
      posY = 2 * ((Window.windowHeight / 2) / 8) * (i - (8/2));
      int randomRGB = int(random(1, 255));
      Walker walker = new Walker();
      walker.position = new PVector(-500, posY);
      walker.mass = 20 + (i + 1/ 5);
      walker.scale = 50 +(i + 1 / 5);
      walker.setColor(255,randomRGB, 50, 255);
      
      Walker[i] = walker;
    }
}

void drawLine()
{
  strokeWeight(5);
  color white = color (255,255,255);
  stroke(white);
  line(0, 360, 0, -360);
}

void mousePressed()
{
  for (int i = 0; i < 8; i++)
  {
    Walker[i] = null;
  }
  createWalker();
  clear();
  loop();
}
