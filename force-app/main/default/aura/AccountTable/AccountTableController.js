({
    fetchAccounts : function(component, event, helper) {
        var action = component.get("c.fetchAccts");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.acctList", records);
            }
        });
        $A.enqueueAction(action);
    }
})