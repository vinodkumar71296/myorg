public class AccountContactListController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accountId) {
        try {
            List<Contact> contacts = [SELECT Id, Name, Phone, Email, AccountId, Account.Name FROM Contact WHERE AccountId = :accountId ORDER BY Name ASC];
            return contacts;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static Contact createContact(Contact contact) {
        try {
            insert contact;
            return contact;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static Contact updateContact(Contact contact) {
        try {
            update contact;
            return contact;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteContact(Id contactId) {
        try {
            Contact contactToDelete = [SELECT Id FROM Contact WHERE Id = :contactId LIMIT 1];
            delete contactToDelete;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}