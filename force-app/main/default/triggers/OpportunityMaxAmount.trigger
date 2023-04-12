trigger OpportunityMaxAmount on Opportunity (after insert, after update, after delete, after undelete) 
{
	Set<Id> accids = new Set<Id>();
    
    if(Trigger.isInsert || Trigger.isUndelete)
    {
        for(Opportunity opty : trigger.new)
        {
            if(opty.AccountId != null)
            { 
            accids.add(opty.AccountId);
            }    
        }
    }
    
    if(Trigger.isUpdate || Trigger.isDelete)
    {
        for(Opportunity opty : trigger.old)
        {
            if(opty.AccountId != null)
            { 
            accids.add(opty.AccountId);
            }    
        }
    }
    
    List<Account> lsttoupdate = new List<Account>();
    
    for(AggregateResult ar : [SELECT AccountId accid, Max(Amount) MaxAmount from Opportunity WHERE AccountId IN:accids GROUP BY AccountId ])
    {
        Account acc = new Account();
        acc.Id = (Id)ar.get('accid');
        acc.Max_Amount__c = (Decimal)ar.get('MaxAmount');
        lsttoupdate.add(acc);
    }
    if(!lsttoupdate.isEmpty()){
    	update lsttoupdate;
        }
}