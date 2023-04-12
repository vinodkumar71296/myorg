public class CreateAccounts {

@AuraEnabled
public static void insertAccounts(String Name, String Phone, String Industry, String Website) {

    Account acct = new Account();
        acct.Name = Name ;
        acct.Phone = Phone;
        acct.Industry = Industry;
        acct.Website = Website;
    Insert acct;
}

}