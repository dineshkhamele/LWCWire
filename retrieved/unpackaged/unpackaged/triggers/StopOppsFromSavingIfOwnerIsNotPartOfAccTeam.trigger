trigger StopOppsFromSavingIfOwnerIsNotPartOfAccTeam on Opportunity (before insert, before update) {
    
    Set<Id> oppsToProcess = new Set<Id>() ;
    Set<Id> accountIds = new Set<Id>();  
    
    // Get Opporutnities having account associated with it
    for(Opportunity opp:trigger.new){
        if (opp.Account != null){
            OppsToProcess.add(opp.Id);
            accountIds.add(opp.Account.Id);
        } 
    }
    
    // fail fast
    if(OppsToProcess.size()==0) return;
    
    List<AccountTeamMember> theTeams = [Select accountId, userId from AccountTeamMember where AccountId in :accountIds];	
    Map<Id,Set<Id>> acctWiseTeams = new Map<Id,Set<Id>>();
    
    for(AccountTeamMember actTeam:theTeams){
        Set<Id> acctUser = acctWiseTeams.get(actTeam.accountId);
        if(acctUser == null){
            acctWiseTeams.put(actTeam.accountId, new Set<Id>()); 
        }
        
        acctUser = acctWiseTeams.get(actTeam.accountId);
        acctUser.add(actTeam.UserId);
    }  
    
    for(Id oppId : oppsToProcess){      
        Opportunity opp = trigger.newMap.get(oppId);
        Set<Id> userIds = acctWiseTeams.get(opp.AccountId);
        if(userIds == null) {
            opp.addError('Owner Id does not exist in AccountTeam');
            continue;
        }
        if(!userIds.contains(opp.OwnerId)) {
            opp.addError('Owner Id does not exist in AccountTeam');
        }
    }
}