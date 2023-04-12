public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [SELECT Id, Name, Phone, Email FROM Contact WHERE AccountId = :accountId];
    }
}