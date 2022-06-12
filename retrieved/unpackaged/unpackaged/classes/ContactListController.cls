public with sharing class ContactListController {

    public PageReference save() {
        update contacts;
        return null;
    }


  public List<contact> contacts {get;set;}
  
  public ContactListController () {
  
   contacts  = [SElect firstname,lastname,email,nominate_for_seminar__c from Contact];
  }
  


}