public class ContactHandler {
    
    public static void afterContactInsert(List <Contact> contactList){
        
        // get all of the account IDs for the contacts
        Set<ID> accountIDs = new Set<ID>();
        for(Contact ct:contactList){
            if(ct.AccountId != null){
                accountIDs.add(ct.AccountId);
            }
        }
        
        // Only query those accounts for the contacts that do not yet have First_Contact_Name set
        
        Map<ID,Account> accounts = new Map<ID,Account>(
            [ Select ID, First_Contact_Email__c, First_Contact_Name__c 
             from Account 
             Where ID in :accountIDs AND First_Contact_Name__c = null]);
        
        // Exit if there are no accounts to set
        
        if(accounts.size()==0) return;
        
        // We don't need to keep track of those that need to be updated as by definition all of these accounts have a 
        // new first contact
        
        for(Contact ct:contactList){
            if(ct.AccountId!=null){
                Account act=accounts.get(ct.AccountId);
                
                // Note, contact name property is not yet available in the after insert trigger
                act.First_contact_Name__c = ((ct.FirstName !=null)? ct.FirstName + ' ':'') + ct.LastName;
                act.First_Contact_Email__c = ct.Email;
            }
        }
        try {
        update accounts.values();
        }
        catch(Exception ex){
            System.debug('An error occured: ' + ex.getMessage());
        }
    }
}