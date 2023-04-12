public class ContactTriggerHelper {

    public static void vipContactCount(List<Contact> ContactList){
        Set<id> accids = new Set<id>();
        
        for(contact con : ContactList)
        {
            if (con.AccountId != null) 
            {
            accids.add(con.AccountId);
        	}
        }   
    
    List<Account> acctsToRollup = new List<Account>();
    
    for(AggregateResult ar : [SELECT AccountId accid, Count(Id) ContactCount FROM Contact WHERE VIP__c = true AND AccountId IN: accids GROUP BY AccountId] )
    {
        Account acc = new Account();
        acc.id = (Id)ar.get('accid');
        acc.Total_VIP_Contacts_Number__c = (Integer)ar.get('ContactCount');
        acctsToRollup.add(acc);
    }
    if(!acctsToRollup.isEmpty()){
        try{
    	Update acctsToRollup;
        }
        catch(System.Exception ex){
            TransactionLogHandler.doHandleException(ex, 'ContactTriggerHelper');
        }
        }
    }
    
    public static void contactCount(List<Contact> ContactList){
         Set<id> accids = new Set<id>();
        
        for(contact con : ContactList)
        {
            if (con.AccountId != null) 
            {
            accids.add(con.AccountId);
        	}
        }   
    List<Account> acctsToRollup = new List<Account>();
    
    for(AggregateResult ar : [SELECT AccountId accid, Count(Id) ContactCount FROM Contact WHERE AccountId IN: accids GROUP BY AccountId] )
    {
        Account acc = new Account();
        acc.id = (Id)ar.get('accid');
        acc.Count__c = (Integer)ar.get('ContactCount');
        acctsToRollup.add(acc);
    }
    if(!acctsToRollup.isEmpty()){
    	Update acctsToRollup;
        }
	}
}