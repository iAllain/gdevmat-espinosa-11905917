void setup()
{
  camera (0,0, Window.eyeZ, 0,0,0,0,-1,0);
   size (1280, 720, P3D);
}

PVector mousePOS()
{
  float x = mouseX - Window.widthPx / 2; // size
  float y = - (mouseY - Window.heightPx / 2);
  return new PVector(x,y);
}
  
void draw()
{
  background (130);
  
  strokeWeight(40);
  strokeCap(ROUND);
  stroke(255,0,0, 300);
  
  PVector outerGlow = mousePOS();
  
  outerGlow.normalize().mult(410);
  line(0,0,outerGlow.x,outerGlow.y);
  line(0,0, -1 * outerGlow.x, -1* outerGlow.y);
  
  strokeWeight(16);
  strokeCap(ROUND);
  stroke(255,255,255);
  
  PVector innerGlow = mousePOS();
  
  innerGlow.normalize().mult(400);
  line(0,0,innerGlow.x,innerGlow.y);
  line(0,0, -1 * innerGlow.x, -1* innerGlow.y);
  
  strokeWeight(40);
  strokeCap(ROUND);
  stroke(0,0,0, 250);
  
  PVector handle = mousePOS();
  
  handle.normalize().mult(100);
  line(0,0,handle.x,handle.y);
  line(0,0, -1 * handle.x , -1* handle.y);
  
  println(handle);
  
}
