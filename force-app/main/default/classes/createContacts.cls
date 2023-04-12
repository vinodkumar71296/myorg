public without sharing class createContacts {

    @AuraEnabled
    public static void insertContacts(String jsonOfListOfContacts, Id AccId) {

        List<Contact> listOfContacts = (List<Contact>) JSON.deserialize(jsonOfListOfContacts, List<Contact>.class);     
        List<Contact> conlst = new List<Contact>();
        for(contact c : listOfContacts){
            contact con = new contact();
            con.AccountId = AccId;
            con.Email = c.Email;
            con.FirstName = c.FirstName;
            con.LastName = c.LastName;
            conlst.add(con);
        }
        insert conlst;
    }

}