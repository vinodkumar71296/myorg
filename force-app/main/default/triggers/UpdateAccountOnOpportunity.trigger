trigger UpdateAccountOnOpportunity on Opportunity (after insert, after update, after delete) {
    set<Id> accountIds = new set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate){
        for (Opportunity opp : Trigger.new){
            accountIds.add(opp.AccountId);
        }
    }
    if(Trigger.isDelete){
        for(Opportunity opp : Trigger.old){
            accountIds.add(opp.AccountId);
        }
    }
    List<Account> accountsToUpdate = new List<Account>();
    for(Account acc : [SELECT Id, (SELECT Id, StageName FROM Opportunities WHERE StageName = 'Closed Won') FROM Account WHERE Id IN :accountIds]) {
        Boolean hasClosedWonOpportunities = false;
        for(Opportunity opp : acc.Opportunities) {
            if(opp.StageName == 'Closed Won' && (Trigger.isInsert || Trigger.isUpdate || !Trigger.oldMap.containsKey(opp.Id))) {
                hasClosedWonOpportunities = true;
                break;
            }
        }
        acc.Has_Closed_Won_Opportunities__c = hasClosedWonOpportunities;
        accountsToUpdate.add(acc);
    }
    update accountsToUpdate;
}