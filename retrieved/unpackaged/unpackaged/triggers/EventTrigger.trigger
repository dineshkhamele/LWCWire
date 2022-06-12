trigger EventTrigger on Message_Event__e (after insert) {

    System.debug('inside trigger');
    for(Message_Event__e ev: Trigger.new){
        Lead l = new lead();
        l.lastname = ev.Desceiption__c;
        insert l;
    }
}