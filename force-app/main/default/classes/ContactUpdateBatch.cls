Global class ContactUpdateBatch implements Database.Batchable<SObject>, Schedulable
{
	Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        string contactsQuery = 'SELECT Id, FirstName, LastName, Email, MailingCity, Phone FROM Contact';
        return Database.getQueryLocator(contactsQuery);
    }
    
    Global void Execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(! recordsToProcess.isEmpty())
        {
            List<Contact> contactsToUpdate = new List<Contact>();
            
            for(SObject obj : recordsToProcess)
            {
                Contact contactRecord = (Contact) obj;
                
                	contactRecord.MailingCity = 'Hyderabad';
                	contactRecord.Phone = '5555888899';
                
                contactsToUpdate.Add(contactRecord);
            }
            
            if(! contactsToUpdate.isEmpty())
            {
                Update contactsToUpdate;
            }
        }
    }
    
    Global void Finish(Database.BatchableContext bContext)
    {
        System.debug('Batch Job Id is....: '+ bContext.getJobId());
        
        AsyncApexJob jobDetails = [Select id, status, totaljobItems, jobitemsprocessed, 
                                  			numberoferrors, createdby.email
                                  					from AsyncApexJob
                                  							Where id =: bContext.getJobId()];
        
		MessagingUtilityHelper.SendBatchJobStatusNotifications(jobDetails,'ContactUpdateBatch');        
    }
    
    Global void execute(SchedulableContext sContext){
        
        ContactUpdateBatch obj = new ContactUpdateBatch();
		Database.executeBatch(obj);
    }
    
}