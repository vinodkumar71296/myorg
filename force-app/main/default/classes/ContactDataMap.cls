/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 03-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public without sharing class ContactDataMap {
  @AuraEnabled(cacheable=true)
  public static list<Contact> getContactsByAccountId(Id accId) {
    return [
      SELECT Id, AccountId, MailingLatitude,MailingLongitude
      FROM Contact
      WHERE AccountId = :AccId
    ];
  }
}