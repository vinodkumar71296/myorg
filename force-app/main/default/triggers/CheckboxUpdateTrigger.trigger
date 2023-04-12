trigger CheckboxUpdateTrigger on Site_Amendment_Association__c (after insert) {
    
    List<Site_Amendment_Association__c> recordslst = new List<Site_Amendment_Association__c>();
    List<Site_Amendment_Association__c> activerecord = new List<Site_Amendment_Association__c>();
    
    Set<Id> latestrecordid = new Set<Id>();
    for(Site_Amendment_Association__c latestrecord : trigger.new){
        if(latestrecord.CreatedDate != null){
            latestrecordid.add(latestrecord.id);
        }
        
        activerecord =  [SELECT id,active__c FROM Site_Amendment_Association__c order by CreatedDate desc limit 1]; 
        for(Site_Amendment_Association__c activerecord:activerecord){
            activerecord.active__c=true;
            
        }
        update activerecord; 
        
        recordslst = [SELECT id,active__c FROM Site_Amendment_Association__c 
                      WHERE active__c=true AND Id NOT IN:latestrecordid];
        for(Site_Amendment_Association__c remainingrecords:recordslst)
            remainingrecords.active__c=false;
        update recordslst;
    }
}