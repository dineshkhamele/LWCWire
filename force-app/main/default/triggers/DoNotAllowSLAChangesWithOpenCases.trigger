trigger DoNotAllowSLAChangesWithOpenCases on Account (before update) {

    // find accounts open cases
     
   List<Account> accountsWithCases = [select Id, (select Id from cases where isClosed = false Limit 1)
                                      from Account
                                      where Id in:trigger.new]; 
    
    for(Account acc:accountsWithCases){
        // check if the accounts SLA field is changed 
        String oldSLAValues = trigger.oldMap.get(acc.id).SLA__c;
        
        String newSLAValue = trigger.newMap.get(acc.id).SLA__c;
        
        Boolean isAccSLAChanged = oldSLAValues != newSLAValue;
    
    // Check if there are open cases
    Boolean accHasOpenCases = acc.cases.size() > 0;
    
    // get the trigger.new version of the a/c
    // 
    Account accInTriggerNew = trigger.newMap.get(acc.id);
    
    // if sla is changed and there are open cases show the error
    // 
    if(isAccSLAChanged && accHasOpenCases){
        accInTriggerNew.addError('do not change SLA when there are open cases');
    }    
 }
}