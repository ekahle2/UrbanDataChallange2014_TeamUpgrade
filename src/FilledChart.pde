class FilledChart
{

  float x,y;
  float halfWidth,quarterWidth, threeQuarterWidth;  
  float[] maxY = new float[4];
  float[] prevY = new float[4];
  FlowerManager fm_;
  public FilledChart()
  {
    x = y = 0.0f;
    
    halfWidth = width*0.5f;
    quarterWidth = width*0.25f;
    threeQuarterWidth = width-quarterWidth;    
  
  resetMAxY();
  fm_ = new FlowerManager();

  
  }
  
  void draw()
  {
  
    float yStop = drawChartArea(0.0, 0);
   
    yStop = drawChartArea(yStop, 1);
    yStop = drawChartArea(yStop, 2);
    yStop = drawChartArea(yStop, 3);
    resetMAxY();
    
    drawFlowers();
    
    
    drawStationFrameMask();
    
  }
  
  void drawStationFrameMask()
  {
    pushStyle();
    strokeWeight(2.5);
    stroke(111,236,255);
    line(quarterWidth,0,quarterWidth,height);
    line(halfWidth,0,halfWidth,height);
    line(threeQuarterWidth,0,threeQuarterWidth,height);
    popStyle();
    
  }
  
  float drawChartArea(float startY, int _type)
  {
    
    
    pushStyle();
    //strokeWeight(1.0);
    //stroke(255);
    noStroke();
    fill(0,76.5);
    
    beginShape();
    
    vertex(0.0,0.0);
    
    println(dm_.stationTypeCount_[3][_type] + " " +dm_.pstationTypeCount_[3][_type] + " " + tx_);
    
    float stationTyleCount = lerp(dm_.pstationTypeCount_[3][_type], dm_.stationTypeCount_[3][_type], tx_);
    //float stationTyleCount = dm_.stationTypeCount_[3][_type];
    
    y = map(stationTyleCount, 0, min(dm_.MaxStationTypeCount_[3][_type],5),
                                         maxY[3], height);
    vertex(0.0,y);
    if(_type==0)
    {  
    text("Pedestrians",0,y);
    }else if(_type==1)
    {
    text("Buses",0,y);
    }else if(_type==2)
    {
    text("Cars",0,y);
    }else if(_type==3)
    {
    text("Trucks",0,y);
    }
    
    
    for( int i = 0 ; i < 4 ; i++)
    {
      
      
      x = quarterWidth*.5 + quarterWidth*i; 
      stationTyleCount = lerp(dm_.pstationTypeCount_[3-i][_type], dm_.stationTypeCount_[3-i][_type], tx_);
      //stationTyleCount = dm_.stationTypeCount_[3][_type];
      y = map(stationTyleCount, 0, min(dm_.MaxStationTypeCount_[3-i][_type],5),
                                         maxY[3-i], height);
      vertex(x,y);
      //if(y>maxY)maxY = y;
      maxY[i] = y;
    }
    stationTyleCount = lerp(dm_.pstationTypeCount_[0][_type], dm_.stationTypeCount_[0][_type], tx_);
    //stationTyleCount = dm_.stationTypeCount_[3][_type];
    y = map(dm_.stationTypeCount_[0][_type], 0, min(dm_.MaxStationTypeCount_[0][_type],5),
                                         maxY[0], height);
    vertex(width,y);
    vertex(width,0.0);
    
    endShape(CLOSE);
    
    popStyle();
    
    
    return 0.0;
  } 
  
  void resetMAxY()
  {
  maxY[0] = 0;
  maxY[1] = 0;
  maxY[2] = 0;
  maxY[3] = 0;
  }  
 
  void drawFlowers()
  {
    int pollutionIndex = 0;
    
    for(int i = 0 ; i < 4 ; i++)
    {
      float imgX = 0 + quarterWidth*i + 2*1 + 50;
      
      if(dm_.stationCount_[i] <=1)
      {
      pollutionIndex = 0;
      }
      else if(dm_.stationCount_[i] > 1 && dm_.stationCount_[i] <=2)
      {
      pollutionIndex = 1;
      }else if(dm_.stationCount_[i] > 2 && dm_.stationCount_[i] <=3)
      {
      pollutionIndex = 2;
      }else
      {
      pollutionIndex = 3;
      }
      
      image(fm_.flowerStateImgs[ pollutionIndex ], imgX, 260);
    }

    
  
  } 

}
