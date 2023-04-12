public class LeapYear {
    
    integer year;
  
    public void LeapYearCheck(integer year){
    
    do {
        system.debug('Proccesing year====' +year);
        
        if (math.mod(year, 4)== 0){
            
            if(math.mod(year, 100)==0 ){
                
            }
            if(math.mod(year, 400)==0){
                
            }
            system.debug('It is a leap year');
        }
        
        else {
            
            system.debug('It is not leap year');
            
        }
        
        year++;
        
    } while( year <=2000);
    
}

}