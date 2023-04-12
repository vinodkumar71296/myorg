public class UserDataRest {
    @AuraEnabled(cacheable=true)
    public static String getUsers(){
        // Instantiate a new http object
        Http h = new Http();
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://reqres.in/api/users?page=1&per_page=6');
        req.setMethod('GET');
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200){
            system.debug(res.getBody());
            return res.getBody();
        }else{
            return null;
        }
    }
}