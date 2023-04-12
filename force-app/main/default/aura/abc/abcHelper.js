({
getAllAccount : function(component, event, helper) {
        var action=component.get('c.fetchAccount');
        action.setCallback(this,function(response){
           console.log('response===>  '+JSON.stringify(response.getReturnValue()));
            if(response.getReturnValue()!=null){
                console.log('success');
                component.set('v.accountList',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },   
    
        helperGetDetail: function(component, event, helper){
        var acid=component.find('ac').get('v.value');
        console.log(acid);
        var action=component.get('c.getContact');
        action.setParams({
            accid:acid
        });
         action.setCallback(this,function(response){
           console.log('response===>  '+JSON.stringify(response.getReturnValue()));
            if(response.getReturnValue()!=null){
                console.log('success');
                component.set('v.contactList',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    helperGetOpportunity : function(component, event, Helper){
    var opid = component.find('ac').get('v.value');
    console.log(opid);
    var action = component.get('c.getopportunity');
    
    action.setParams({
                accid:opid
});
action.setCallback(this, function(response){
    console.log('opp response==>  '+JSON.stringify(response.getReturnValue()));
    if(response.getReturnValue() != null){
        console.log("OPP success");
        component.set('v.opportunityList', response.getReturnValue());
        console.log("Pass");
    }
}); 
  $A.enqueueAction(action);
}
})