public without sharing class ReusableRelatedList {
    @AuraEnabled (cacheable=true)
    public static RelatedListResult fetchRecord( String recId, String sObjName, String parentFldNam) {
        system.debug(recId);
        system.debug(sObjName);
        system.debug(parentFldNam);
        
        List < sObject > listsObjects = new List < sObject >();
        RelatedListResult obj = new RelatedListResult();
        String strSOQL = 'SELECT Id FROM ' + sObjName + ' WHERE ' + parentFldNam + ' = \'' + recid + '\' LIMIT 4';
        system.debug(strSOQL);
        listsObjects =  Database.query( strSOQL );
        Integer intCount = listsObjects.size();
        if ( intCount > 3 ) {
            List < sObject > tempListsObjects = new List < sObject >();
            for ( Integer i = 0; i <3; i++ )
                tempListsObjects.add( listsObjects.get( i ) );
            obj.listsObject = tempListsObjects;
        } else {
            obj.listsObject = listsObjects;
        }
        return obj;
    }
    public class RelatedListResult {
        @AuraEnabled
        public List < sObject > listsObject;
    }
}