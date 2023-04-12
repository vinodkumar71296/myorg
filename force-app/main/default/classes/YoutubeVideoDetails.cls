global class YoutubeVideoDetails {
    
    webservice static void details(String videoId, String recId){
        
        String enckey= Youtube_API_Setting__c.getInstance('Youtube API Key').Value__c;
        	system.debug('enckey='+enckey);
        
        String endpt = Youtube_API_Setting__c.getInstance('Youtube endpoint').Value__c;
			system.debug('endpointapi='+endpt);
        
        endpt = endpt.replace('{API_KEY}', enckey);
        endpt = endpt.replace('{VIDEO_ID}', videoId);
        
        system.debug('endpt=='+endpt);
        
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(+endpt);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        System.debug('httpRes '+response);

        JsonParser J = (JsonParser)Json.deserialize(response.getBody(), JsonParser.class);
        
        system.debug(+J);
        
        Youtube_Video_Detail__c yv = new Youtube_Video_Detail__c();
        yv.Id = recId;
        yv.Number_of_Comments__c = J.items[0].Statistics.commentCount;
        yv.Number_of_Likes__c = J.items[0].Statistics.likeCount;
        yv.Favourite__c = J.items[0].Statistics.favoriteCount;
        yv.Number_of_View_Counts__c = J.items[0].Statistics.viewCount;
        
        update yv;
    }
   

   public class JsonParser {

	public String kind;
	public String etag;
	public List<Items> items;
	public PageInfo pageInfo;
   }
    
	public class PageInfo {
		public Integer totalResults;
		public Integer resultsPerPage;
	}

	public class Items {
		public String kind;
		public String etag;
		public String id;
		public Statistics statistics;
	}

	public class Statistics {
		public String viewCount;
		public String likeCount;
		public String favoriteCount;
		public String commentCount;
	}

}