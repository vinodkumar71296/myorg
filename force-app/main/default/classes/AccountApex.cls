/**
 * @description       :
 * @author            : Vinodkumar
 * @group             :
 * @last modified on  : 04-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public class AccountApex {
  @auraEnabled
  public static list<account> fetchAccount() {
    list<account> accList = new List<account>();
    accList = [SELECT name FROM account];
    return accList;
  }

  @auraEnabled
  public static list<contact> getContact(id accid) {
    list<contact> conList = new List<contact>();
    conList = [SELECT lastname FROM contact WHERE accountid = :accid];
    return conList;
  }

  @auraEnabled
  public static list<opportunity> getopportunity(id accid) {
    list<opportunity> opList = new List<opportunity>();
    opList = [SELECT name FROM opportunity WHERE accountid = :accid];
    return opList;
  }
}
