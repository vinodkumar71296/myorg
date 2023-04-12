public class PositionCanditateUpdate {
    
    public static void CanditateUpdate(){
        
        list<position__c> listpos = new list<position__c>();
        list<canditate__c> canlist = new list<canditate__c>();
              
        for( position__c positionList : listpos){
            
            canditate__c can = new canditate__c();
            can.Name = positionList.Name;
            can.Address__c = positionList.Name;
            can.Id = positionList.Id;            
            canlist.add(can);
        }
        
        Insert canlist;
    }

}