@RestResource(urlMapping = '/NotificationApi/*')
Global with sharing class DrinkDispatchApi {
    @HTTPPost   
    global static String CreateNewNotification(notificationWrapper wrapperObj){
        
        //RestRequest NotificationRequest = RestContext.request;
        
       // String requestBody = NotificationRequest.requestBody.toString();
        
        //Notification__c Notification = (Notification__c) JSON.deserialize(requestBody, Notification__c.class);
        
        Notification__c NotificationObj = new Notification__c();
        
        NotificationObj.Universal_Player_ID__c = wrapperObj.UniversalPlayerId;
        NotificationObj.Drinks_Dispatch_View_Id__c = wrapperObj.DrinksDispatchViewId;
        NotificationObj.Machine_Location__c = wrapperObj.MachineLocation ;
        NotificationObj.Notified__c = wrapperObj.Notified;
        //NotificationObj.Event_Date_Time__c = wrapperObj.EventDateTime;
        
        insert NotificationObj;
        
        return NotificationObj.id;        
    }
    global class notificationWrapper {
        
        public String UniversalPlayerId;
        public Integer DrinksDispatchViewId;
        public String MachineLocation;
        public Boolean Notified;
        //public DateTime EventDateTime;
        
    }
	/*
	@HTTPPost   
    global static String CreateNewNotification(String UniversalPlayerId, 
                                               Integer DrinksDispatchViewId, 
                                               string MachineLocation, 
                                               boolean Notified,
                                               Datetime EventDateTime){
               system.debug('entered');

        system.debug('UniversalPlayerId'+UniversalPlayerId);
        Notification__c NotificationObj = new Notification__c();
        
        NotificationObj.Universal_Player_ID__c = UniversalPlayerId;
        NotificationObj.Drinks_Dispatch_View_Id__c = DrinksDispatchViewId;
        NotificationObj.Machine_Location__c = MachineLocation ;
        NotificationObj.Notified__c = Notified;
        //NotificationObj.Event_Date_Time__c = EventDateTime;
        
        insert NotificationObj;
        
        return NotificationObj.id;*/        
        
    }