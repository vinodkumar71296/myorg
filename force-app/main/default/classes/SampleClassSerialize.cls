public class SampleClassSerialize {
    
    public static string getAccountAsString(){
        
        Account acc = new Account();
        
        acc.Name = 'Ramesh';
        acc.AccountNumber = '23454543343';
        acc.AnnualRevenue = 12000000;
        acc.Phone = '998494993034';
        insert acc;
		string accRecord = System.JSON.serialize(acc);        
        
		CreateAccountRecord(accRecord);
		
        return accRecord;
   }
    @future
    public static void CreateAccountRecord (String accRecord ){
        
        system.debug (accRecord);
        Account acc = (Account) System.JSON.deserialize(accRecord, Account.Class);
        system.debug(acc);
    }

}