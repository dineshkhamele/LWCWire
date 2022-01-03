public with sharing class ApexClass {
    
    public ApexClass() {

    }

    @AuraEnabled(Cacheable=true)
    public static string getResponse(String text){
        try {

            // Contact aContact = new Contact();
            // acontact.FirstName='Dinesh';
            // aContact.lastName='khamele';

            // insert aContact;

            return 'Text = ' + text;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    } 


}
