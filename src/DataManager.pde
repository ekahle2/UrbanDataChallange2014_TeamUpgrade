class DataManager{

  int[] stationCount_ = new int[4];
  int[] typeCount_ = new int[4];
  int[][] stationTypeCount_ = new int[4][4];
  int[][] pstationTypeCount_ = new int[4][4];
  int[][] MaxStationTypeCount_ = new int[4][4];
  
  public DataManager()
  {
  clearMaxStationTypeArray();
  swapStationTypeCound();
  }
  
  void clearStationArray(){

    for(int i = 0 ; i < stationCount_.length ; i++)
    {
    
      stationCount_[i]=0;
    }
  
  }
  void clearTypeArray(){

    for(int i = 0 ; i < typeCount_.length ; i++)
    {
    
      typeCount_[i]=0;
    }
  
  }
  
   void clearStationTypeArray(){

    for(int i = 0 ; i < stationTypeCount_.length ; i++)
    {
      for(int j = 0 ; j < stationTypeCount_.length ; j++)
      {
        stationTypeCount_[i][j]=0;
        pstationTypeCount_[i][j]=0;
      }    
      
    }
  
  } 
  
    void clearMaxStationTypeArray(){

    for(int i = 0 ; i < stationTypeCount_.length ; i++)
    {
      for(int j = 0 ; j < stationTypeCount_.length ; j++)
      {
        MaxStationTypeCount_[i][j]=0;
      }    
      
    }
  
  }  
  
  void getMaxes(String station, String object,int count)
  {
    int locId_ = -1;
    int typeId_ = -1;
    
   if( station.equals("Embarcadero"))
   {
      locId_= 0;
   }else if(station.equals("Montgomery"))
   {
      locId_ = 1;
   }else if(station.equals("Powell"))
   {
      locId_ = 2;
   }else{
      locId_ = 3;
   }
     
   if( object.equals("Pedestrians"))
   {
      typeId_= 0;
   }else if(object.equals("Buses"))
   {
      typeId_ = 1;
   }else if(object.equals("Cars"))
   {
      typeId_ = 2;
   }else{
      typeId_ = 3;
   } 

   if(MaxStationTypeCount_[locId_][typeId_] < count)
   {
   
     MaxStationTypeCount_[locId_][typeId_]  = count;
   }
    
  }
  
  
  void swapStationTypeCound()
  {

  
    //arrayCopy(stationTypeCount_, pstationTypeCount_);
  }
   
  
}
