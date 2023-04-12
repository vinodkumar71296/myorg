trigger AccountTrigger on Account (before Update, after Update) {
    
    if(trigger.isBefore && trigger.isUpdate)
    {
        system.debug('Trigger.new :::'+Trigger.new);
        system.debug('Trigger.newMap :::'+Trigger.newMap);
        system.debug('Trigger.old :::'+Trigger.old);
        system.debug('Trigger.oldMap :::'+Trigger.oldMap);
    }
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        system.debug('Trigger.new :::'+Trigger.new);
        system.debug('Trigger.newMap :::'+Trigger.newMap);
        system.debug('Trigger.old :::'+Trigger.old);
        system.debug('Trigger.oldMap :::'+Trigger.oldMap);
    }

}