public class AccountClass {
    @AuraEnabled (cacheable=true)
    public static List<account> accountclass() {
        List<Account> acc=[select id,name from Account limit 5];
        return acc;
        // added comment
    }
 }