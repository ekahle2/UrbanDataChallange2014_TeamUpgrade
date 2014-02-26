class DataPoint{

  String date_;
  String location_;
  int locId_;
  String type_;
  int typeId_;
  int count_;
  
  public DataPoint( String date, String location, String type, int count)
  {
    this.date_ = date;
    this.location_ = location;
    this.type_ = type;
    this.count_ = count;
  
    if( location.equals("Embarcadero"))
    {
    locId_= 0;
    }else if(location.equals("Montgomery"))
    {
    locId_ = 1;
    }else if(location.equals("Powell"))
    {
    locId_ = 2;
    }else{
    locId_ = 3;
    }
   
    if( type.equals("Pedestrians"))
    {
    typeId_= 0;
    }else if(type.equals("Buses"))
    {
    typeId_ = 1;
    }else if(type.equals("Cars"))
    {
    typeId_ = 2;
    }else{
    typeId_ = 3;
    }    
  
  
  }
  
}
