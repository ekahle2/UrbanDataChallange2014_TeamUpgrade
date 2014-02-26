Table table;
int counter;

HashMap<String, ArrayList<DataPoint> > dataMap_;
String[] dateArray_ = new String[20160];
int dateIndex_;

DataManager dm_;
FilledChart fc_;

float WINDOWSCALE = 0.7;

float tx_ = 0;
float lastMillis = 0;
float dt = 0;
float updateTimer = 0;
String pwd;
void setup() {
  
  size(int(1920*WINDOWSCALE), int(1080*WINDOWSCALE));
  //size(500, 500);
  println(dataPath(""));
  pwd= dataPath("");
  table = loadTable(pwd+"/urban_data.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  dataMap_ = new HashMap<String, ArrayList<DataPoint> >();
  dateIndex_=0;
  dm_ = new DataManager();
  fc_ = new FilledChart();
  
  
  for (TableRow row : table.rows()) {
    String time = row.getString("Timestamp");
    String station = row.getString("Station");
    String object = row.getString("Object");
    int count = row.getInt("Count");
    
    if(dataMap_.containsKey(time) ){
    
      //we have key add to collection  
      dataMap_.get(time).add(new DataPoint(time, station,object, count) );
      
      
      
    }
    else
    {
    
      //create collection and add value
      dataMap_.put(time, new ArrayList<DataPoint>() );
      dataMap_.get(time).add(new DataPoint(time, station,object, count) );
      dateArray_[dateIndex_++] = time;
    }
    
    dm_.getMaxes(station, object, count);
    
    //println(time, station, object, count);
  }
  dateIndex_=0;//reinit after load
  dm_.clearStationArray();
  dm_.clearTypeArray();
  dm_.clearStationTypeArray();
  
  println("Load Complete");
  
  
  textSize(32);
}

void update(){

  
}

void draw()
{
  background(111,236,255);
 if(tx_<1.0)tx_ +=.05;
  //if(updateTimer>300)nextDataPoint(); 
 updateTimer += millis()-lastMillis;
  
  fc_.draw();
  

  lastMillis = millis();
}

void keyPressed()
{

  
  if(key==CODED)
  {
  
    if(keyCode == LEFT)
    {
      if(dateIndex_>0)dateIndex_--;
    } else if(keyCode == RIGHT)
    {
      if(dateIndex_<dateArray_.length)dateIndex_++;
      tx_ = 0;
    
    }
    
    
  }
   if(key== ' ' )
    { 
      dm_.swapStationTypeCound();
    } 
  
    

  dm_.clearStationArray();
  dm_.clearTypeArray();
  dm_.clearStationTypeArray();
  
    ArrayList<DataPoint> dateList = dataMap_.get(dateArray_[dateIndex_]);
  
  for( int i = 0 ; i < dateList.size() ; i++)
  {
    println(dateList.get(i).date_ + " " + dateList.get(i).location_ + " " + dateList.get(i).type_  + " " + dateList.get(i).count_);
    
    dm_.stationCount_[dateList.get(i).locId_] += dateList.get(i).count_;
    dm_.typeCount_[dateList.get(i).typeId_] += dateList.get(i).count_;
    
    dm_.stationTypeCount_[dateList.get(i).locId_][dateList.get(i).typeId_] += dateList.get(i).count_;
    
    
  }
  
  dateList = dataMap_.get(dateArray_[max(dateIndex_-1,0)]);
  for( int i = 0 ; i < dateList.size() ; i++)
  {
   
    dm_.pstationTypeCount_[dateList.get(i).locId_][dateList.get(i).typeId_] += dateList.get(i).count_;
    
    
  }  
}

void nextDataPoint(){

  if(dateIndex_<dateArray_.length)dateIndex_++;
      tx_ = 0;
      updateTimer = 0;
}


