public with sharing class controller2 {

    public final Account contact { get; set; }

   public controller2() {   
      contact = [select name from account where id = :ApexPages.currentPage().getParameters().get('id')];         
   }
   
    public PageReference SaveContact() {
        update contact;
        return null;
    }
}