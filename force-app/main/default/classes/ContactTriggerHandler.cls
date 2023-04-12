public class ContactTriggerHandler implements TriggerInterface {
    
    public static void beforeInsert(List<sObject> newRecordsList){
    
    }

    public static void afterInsert(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap){
        ContactTriggerHelper.vipContactCount(newRecordsList);
        ContactTriggerHelper.contactCount(newRecordsList);
    }

    public static void beforeUpdate(Map<Id, sObject> newRecordsMap, Map<Id, sObject> oldRecordsMap){
        
    }

    public static void afterUpdate(Map<Id, sObject> newRecordsMap,  Map<Id, sObject> oldRecordsMap){
         ContactTriggerHelper.vipContactCount (oldRecordsMap.values());
        ContactTriggerHelper.contactCount (oldRecordsMap.values());
    }
          
    public static void beforeDelete(List<sObject> oldRecordsList , Map<Id, sObject> oldRecordsMap){
        
    }

    public static void afterDelete(Map<Id, sObject> oldRecordsMap){
        ContactTriggerHelper.vipContactCount(oldRecordsMap.values());
        ContactTriggerHelper.contactCount(oldRecordsMap.values());
    }
    
    public static void afterUnDelete(List<sObject> newRecordsList , Map<Id, sObject> newRecordsMap) {
         ContactTriggerHelper.vipContactCount(newRecordsList);
         ContactTriggerHelper.contactCount(newRecordsList);
    }
}