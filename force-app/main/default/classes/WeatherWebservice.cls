global class WeatherWebservice {
    
    @AuraEnabled (cacheable=true)
    global static WeatherData performCallout(String location) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();         
        request.setEndpoint('callout:WeatherAPI?&city=' + location + '&key=68daa7a2a7604e6985883c184a438481'); 
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        JSONParser parser = JSON.createParser(response.getBody());
        
        WeatherData weather = new WeatherData();
        
        while (parser.nextToken() != null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if (parser.getCurrentName() == 'temp') {
                    weather.cityTemp = Decimal.valueOf(parser.getText());
                } else if (parser.getCurrentName() == 'city_name') {
                    weather.cityName = parser.getText();
                } else if (parser.getCurrentName() == 'state_code') {
                    weather.state = parser.getText();
                } else if (parser.getCurrentName() == 'timezone') {
                    weather.cityTimeZone = parser.getText();
                } else if (parser.getCurrentName() == 'wind_spd') {
                    weather.cityWindSpeed = Decimal.valueOf(parser.getText());
                } else if (parser.getCurrentName() == 'lat') {
                    weather.cityLat = parser.getText();
                } else if (parser.getCurrentName() == 'lon') {
                    weather.cityLong = parser.getText();
                } else if (parser.getCurrentName() == 'precip') {
                    weather.cityPrecip = Decimal.valueOf(parser.getText());
                    
                }
            }
            
        }
        system.debug(weather);
        return weather;
        
        
    }   
    global class WeatherData {
        @AuraEnabled public String cityName;
        @AuraEnabled public String cityTimeZone;
        @AuraEnabled public Decimal cityTemp;
        @AuraEnabled public String state;
        @AuraEnabled public Decimal cityWindSpeed;
        @AuraEnabled public String cityLat;
        @AuraEnabled public String cityLong;
        @AuraEnabled public Decimal cityPrecip;
    }
    
}