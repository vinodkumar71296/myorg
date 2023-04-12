public class GetMapData {

    public static string getLatitudeLongitude(String Address){

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndPoint('http://geocode.maps.co/search?q='+Address);
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        return resp.getBody();
    }

}