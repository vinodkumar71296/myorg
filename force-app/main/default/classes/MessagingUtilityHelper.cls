public class MessagingUtilityHelper 
{
	Public static void SendBatchJobStatusNotifications(AsyncApexJob jobInfo, string jobName)
    {
        if(jobInfo != null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            	
            	string[] toAddress = new string[]{jobInfo.CreatedBy.Email, 'vinodkumar.c@tavant.com'};
            	email.setToAddresses(toAddress);
            
            	email.setReplyTo('customersupport@tavant.com');
            
            	email.setSenderDisplayName('Contact Batch Update Team');
            
            	string emailSubject = 'Alert : Contact Update Batch Job Status Notification: '+ jobName + ' - ( '+ jobInfo.Id+ ' )';
            	email.setSubject(emailSubject);
            
            	string emailContent = 'Hello, <br/><br/> We are pleased to inform you that we have executed the Contact Update Batch Job. <br/><br/>'+
                    					'Please find below the Batch Job Status Details....: <br/><br/>'+
                    					'Batch Job Id .......: ' + jobInfo.Id+
                    					'<br/> Batch Job Name ......: '+ jobName+
                    					'<br/> Batch Job Status .......: '+ jobInfo.Status+
                    					'<br/> Total Number of Batches ......: '+ jobInfo.TotalJobItems+
                    					'<br/> Number of Batvhes Processed .....: '+ jobInfo.JobItemsProcessed+
                    					'<br/> Number of Batches Failed.........: '+ jobInfo.NumberOfErrors+
                    					'<br/><br/> Please find the below address, if any queries. '+
                    					'<br/><br/> <i> *** This is a System Generated Email. Please Do Not Reply.</i>'+
                    					'<br/><br/> Thanks & Reagrds, <br/> Support Team, <br/> Tavant ';
                email.setHtmlBody(emailContent);
            
            	Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        }
    }
}