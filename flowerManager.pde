class FlowerManager
{
  PImage[] flowerStateImgs = new PImage[4];
  
  float x,y;
  float w,h;
  PVector[] ImgPos = new PVector[4];
  
  FlowerManager()
  {
    //1 is biggest
    flowerStateImgs[0] = loadImage(pwd+"/fl_1.png");
    flowerStateImgs[1] = loadImage(pwd+"/fl_2.png");
    flowerStateImgs[2] = loadImage(pwd+"/fl_3.png");
    flowerStateImgs[3] = loadImage(pwd+"/fl_4.png");
    w = 357 * 1;
    h = 749 *1;
    
    for(int i = 0 ; i < 4 ; i++)
    {
    flowerStateImgs[i].resize(int(w*WINDOWSCALE),int(h* WINDOWSCALE));
    }
    

    
    
  }
  
  void draw()
  {
  
    
  }

}
