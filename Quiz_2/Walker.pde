class Walker
{
  float x;
  float y;
    
  void render()
  {
    int randomRGB = int(random(256));
    int randomAlpha = 50 + int(random(51));
    color random = color (0, randomRGB, 0, randomAlpha);
    fill(random);
    circle(x,y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y++;
    }
    else if (rng == 1)
    {
      y--;
    }
    else if (rng == 2)
    {
      x++;
    }
    else if (rng == 3)
    {
      x--;
    } else if (rng == 4)
    {
      x++;
      y++;
    } else if (rng == 5)
    {
      x--;
      y++;
    } else if (rng == 6)
    {
      x++;
      y--;
    } else
    {
      x--;
      y--;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(9));
    
    if (rng == 0)
    {
      y++;
    }
    else if (rng == 1)
    {
      y--;
    }
    else if (rng == 2)
    {
      x++;
    }
    else if (rng == 3)
    {
      x--;
    } else if (rng == 4 || rng == 8)
    {
      x++;
      y++;
    } else if (rng == 5)
    {
      x--;
      y++;
    } else if (rng == 6)
    {
      x++;
      y--;
    } else
    {
      x--;
      y--;
    }
  }
}
