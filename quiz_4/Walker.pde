public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  public float scale;
  public float tScale = 30;
  
  public float tRandomRGB = int(random(256));
  
  void render()
  {
    color random = color((map(noise(tRandomRGB), 0,1,150,255)), (map(noise(tRandomRGB), 0,1,50,255)),(map(noise(tRandomRGB), 0,1,100,255)));
    scale = map(noise(tScale), 0, 1, -640, 640);
    
    fill (random);
    circle(x,y,tScale);
    
    tScale += 0.1f;
    
    tRandomRGB += 1f;
  }
  
  void perlinWalk()
  {
   x = map(noise(tx), 0, 1, -640, 640); 
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
  }
}
