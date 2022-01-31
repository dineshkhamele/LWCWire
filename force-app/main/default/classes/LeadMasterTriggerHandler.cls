public class LeadMasterTriggerHandler extends TriggerHandlerBase implements TriggerInterface{
    
    //used to prevent recursion if needed
    
    public static Boolean HAS_RUN = false;
    
    //We can use this for a shared update of leads at the end of the class
    private List<Lead> updateLeadList = new List<Lead>();
    
    //use the singleton patter to maintain state of the
    //class across all calls from the trigger
    
    private static LeadMasterTriggerHandler instance;
    public static LeadMasterTriggerHandler getInstance(){
        if(instance == null){
            instance = new LeadMasterTriggerHandler();
        }
        return instance;
    }
    
    private LeadMasterTriggerHandler(){
        //Do stuff for instantiation
    }
        
    public override void finish(){
        update updateLeadList;
    }
}