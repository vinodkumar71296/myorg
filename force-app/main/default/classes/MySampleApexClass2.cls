// Class definition and body
public class MySampleApexClass2 {
   public static Double myValue;   // Class Member variable
   public static String myString;  // Class Member variable
	
   public MySampleApexClass2 () {
      myValue = 100; //initialized variable when class is called
   }
	
   public Double getCalculatedValue ( ) { // Method definition and body
      // do some calculation
      system.debug(myValue);
      myValue = myValue+10;
       system.debug(myValue);
      return myValue;
       
   }
    @future
    public static void myMethod(){
        
        system.debug('I am future method');
    }
    @future
    public static void myMethod1(){
        
        system.debug('I am second future method');
        
    }
}