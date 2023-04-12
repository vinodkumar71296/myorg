public class AccountApex {
    @auraEnabled
    public static list<account> fetchAccount(){
        list<account> accList= new list<account>();
        accList=[select name from account];
        return accList;
    }
    
      @auraEnabled
    public static list<contact> getContact(id accid){
        list<contact> conList= new list<contact>();
        conList=[select lastname from contact where accountid =:accid];
        return conList;
    }
    
    @auraEnabled
    public static list<opportunity> getopportunity(id accid){
        list<opportunity> opList = new list<opportunity>();
        opList = [select name from opportunity where accountid =: accid];
        return opList;
    }
}