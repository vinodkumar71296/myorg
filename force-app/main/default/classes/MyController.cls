public class MyController {
    @AuraEnabled(cacheable=true)
    public static List<AccountWrapper> getAccounts() {
        List<Account> accounts = [SELECT Id, Name, CreatedDate, LastModifiedDate FROM Account];
        system.debug('accounts without format :::'+accounts);
        List<AccountWrapper> accountWrappers = new List<AccountWrapper>();
        
        for (Account acc : accounts) {
            AccountWrapper wrapper = new AccountWrapper();
            wrapper.id = acc.Id;
            wrapper.name = acc.Name;
            wrapper.createdDate = acc.CreatedDate.format('MM/dd/yyyy');
            wrapper.lastModifiedDate = acc.LastModifiedDate.format('MM/dd/yyyy');
            accountWrappers.add(wrapper);
        }
         system.debug('accounts with format :::'+accountWrappers);
        return accountWrappers;
    }


public class AccountWrapper {
    @AuraEnabled public Id id;
    @AuraEnabled public String name;
    @AuraEnabled public String createdDate;
    @AuraEnabled public String lastModifiedDate;
}
}