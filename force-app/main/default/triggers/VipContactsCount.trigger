trigger VipContactsCount on Contact (after insert, after update, after delete, after undelete) 
{
    Set<id> accids = new Set<id>();
    
    if(Trigger.isInsert || Trigger.isUndelete)
    {
        for(contact con : Trigger.new)
        {
            if (con.AccountId != null) 
            {
            accids.add(con.AccountId);
        	}
        }   
    }
    
    if(Trigger.isUpdate || Trigger.isDelete)
    {
        for(contact con : Trigger.old)
        {
            if (con.AccountId != null) 
            {
            accids.add(con.AccountId);
        	}
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
    	Update acctsToRollup;
        }
}