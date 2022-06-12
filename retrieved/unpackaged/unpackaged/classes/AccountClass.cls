public class AccountClass {
    @AuraEnabled (cacheable=true)
    public static List<account> accountclass() {
        List<Account> acc=[select id,name from Account limit 5];
        return acc;
        // added comment from azure board
        // added in vscodecls
        // added in vsc
        // more is added'
        //last line
        // yet snother line
        // added added
        // last line/
        // last line
        
    }
 }