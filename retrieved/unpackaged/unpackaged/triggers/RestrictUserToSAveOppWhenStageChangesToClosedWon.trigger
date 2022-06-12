trigger RestrictUserToSAveOppWhenStageChangesToClosedWon on Opportunity (before update) {

  // Write a bulkified trigger on opportunity to restrict the user to change 
  // the stagename to 'closed won' if there is no 
  // 'OpportunityContactRole' exists for that 
  // opportunity of type role ='Decision Maker'    
    
    // What records to be processed.
    Set<Id> OppToBeProcessed = new Set<Id>();
       
    for(Opportunity opp:Trigger.new){
        if(opp.StageName=='Closed Won' && trigger.oldMap.get(opp.id).stagename <> 'Closed Won'){
            OppToBeProcessed.add(opp.Id);
        }
    }    
    
    if(OppToBeProcessed.size()==0) return;
    
    Map<Id,Opportunity> oppWithDecisionMakerRole = new Map<Id,Opportunity>([select id, (select opportunityid from OpportunityContactRoles where role = 'Decision Maker' Limit 1) from opportunity WHERE Id in :OppToBeProcessed]);
            
     for(ID oppID:OppToBeProcessed){
         // we need instance of Opporutnity to set the error against that record
         if(oppWithDecisionMakerRole.ContainsKey(oppID) && oppWithDecisionMakerRole.get(oppID).OpportunityContactRoles.size()>0){
             continue;
         }

         Opportunity opp = trigger.newMap.get(oppID);
         opp.addError('The record does not have any contact as decision maker');
     }
}