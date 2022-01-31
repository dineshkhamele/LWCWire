public with sharing class controller3 {

    public final Contact contact { get; set; }
    
    public controller3() {
        contact = [select firstname,lastname,name from contact where id = :ApexPages.currentPage().getParameters().get('id')];
    }
          

    public PageReference Cancel() {
        return null;
    }


    public PageReference SaveContact() {
        update contact;
        return null;
    }

}