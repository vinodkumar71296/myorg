({
    doInit : function(component, event, helper) {
        helper.getAllAccount(component, event, helper);
    },
    
    getDetail: function(component, event, helper){
        helper.helperGetDetail(component, event, helper);
         helper.helperGetOpportunity(component, event, helper);
    }  
})