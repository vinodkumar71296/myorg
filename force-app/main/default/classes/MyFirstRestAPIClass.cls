@RestResource(urlMapping='/Accounts/*')
global with sharing class MyFirstRestAPIClass
{
	@HttpGet
	global static String doGet() {
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
        system.debug(req);
    
    // Extract account and contact IDs from URL
    List<String> urlParts = req.requestURI.substring(req.requestURI.indexOf('/')).split('/');
    String accountId = urlParts[2];
        system.debug(accountId);
    String contactId = urlParts[3];
        system.debug(contactId);
    
    // Query for account and contact records
    Account accountResult = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
    Contact contactResult = [SELECT Id, Name, Email, Phone FROM Contact WHERE Id = :contactId AND AccountId = :accountId];

    // Create a Map to return both objects in the response
    Map<String, Object> response = new Map<String, Object>();
    response.put('account', accountResult);
    response.put('contact', contactResult);

    // Serialize the Map as a JSON string and return it in the HTTP response body
    res.addHeader('Content-Type', 'application/json');
     string resp =   JSON.serialize(response);
        
        system.debug(resp);
        String respo = resp;
        
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(respo);
        
        Map<String, Object> contactMap = (Map<String, Object>)responseMap.get('contact');
        
        String contactName = (String)contactMap.get('Name');
        
        System.debug(contactName); // This will output "YS Jagan Mohan Reddy" in the debug log

    	return JSON.serialize(response);
	}

    
    @HttpDelete
    global static string doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug(AccNumber);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE AccountNumber = :AccNumber ];
        system.debug(result);
        if(result != null){
        delete result;
        }
        return 'account deleted';
    }

    @HttpPost
    global static String doPost(String name,String phone,String AccountNumber ) {
        Account acc = new Account();
        acc.name= name;
        acc.phone=phone;
        acc.AccountNumber = AccountNumber ;
        insert acc;
        
        return acc.id;
    }
    
    @HttpPut
	global static String doPut(String accountId, String name, String phone, String AccountNumber) {
    Account acc = [SELECT Id, Name, Phone, AccountNumber FROM Account WHERE Id =: accountId];
    acc.Name = name;
    acc.Phone = phone;
    acc.AccountNumber = AccountNumber;
    update acc;
    return acc.Id;
}

}