trigger CanditateTrigger on Canditate__c (After update) {

    if(trigger.isafter && trigger.isupdate){

        list<Canditate__c> lstcanditate = new list<Canditate__c>();        
        
        integer i = 0;
        
        for(i=0; i <=10 ; i++){
            
            Canditate__c cand = new Canditate__c ();
            cand.Name = 'Test'+i;
            cand.Name__c = 'Testabc'+i;
            lstcanditate.add(cand);
            system.debug('Name=='+cand.Name);
        } 
        insert lstcanditate;
    }
    
}