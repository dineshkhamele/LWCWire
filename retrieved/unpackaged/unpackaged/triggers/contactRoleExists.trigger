trigger contactRoleExists on Opportunity (before insert, before update) {
    
   // Collect all opportunity ids in set whose status is closed Won
   Set<Id> allClosedStageIds = new Set<Id>();
   for(Opportunity oppr:trigger.new){
     if(oppr.StageName =='Closed Won' && trigger.OldMap.get(oppr.Id).StageName != 'Closed Won'){
       allClosedStageIds.add(oppr.id);
    }
  }

 Map<Id,AggregateResult> contactRoleList = new Map<Id,AggregateResult>([SELECT OpportunityId, count(id) theCount FROM OpportunityContactRole 
 WHERE OpportunityId in :allClosedStageIds AND Role='Decision Maker' group by OpportunityId
 having count(id)>0 
]);
      
   for(ID theId:allClosedStageIds){
       AggregateResult ar=contactRoleList.get(theID);
       Integer theCount = (Integer)ar.get('theCount');
     if(!contactRoleList.containsKey(theId) ){
       Opportunity oppr = (Opportunity) trigger.newmap.get(theId);
       oppr.addError('The opportunity should have at least one Contact Role as Decision Maker');
     }
   }
 }