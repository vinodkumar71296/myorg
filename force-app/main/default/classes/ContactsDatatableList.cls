public class ContactsDatatableList {
    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchAllContacts(Id accId) {  
        
        return [SELECT AccountId, Id, Name, MobilePhone, MailingCity, Phone, Department, Email FROM Contact WHERE AccountId =: accId ];
       	
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContacts(Id accId, String SearchKeyword ) {

        SearchKeyword = '%'+SearchKeyword+'%'; 
       
        return [SELECT AccountId, Id, Name, MobilePhone, Department, Email FROM Contact WHERE AccountId =: accid  AND Name LIKE : SearchKeyword];
       	
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getContactFields(){
        SObjectType contactType = Schema.getGlobalDescribe().get('Contact');
        Map<String,Schema.SObjectField> mfields = contactType.getDescribe().fields.getMap();

        List<String> sObjectDetailsList = new List<String>();
        for(String s : mfields.keySet()){
            sObjectDetailsList.add(String.valueOf(mfields.get(s)));
        }
        return sObjectDetailsList;
    }
   
}