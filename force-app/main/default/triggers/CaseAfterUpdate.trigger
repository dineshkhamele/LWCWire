trigger CaseAfterUpdate on Case (after update) {

    System.debug('inside case trigger');
    Message_Event__e evt1 = new Message_Event__e();
    evt1.Desceiption__c = 'Message 1';
    
    Database.SaveResult sr =  EventBus.publish(evt1);
    
    System.debug(sr);
    
    Message_Event__e evt2 = new Message_Event__e();
    evt2.Desceiption__c = 'Message 2';
    Database.SaveResult sr2 =  EventBus.publish(evt1);
    EventBus.publish(evt2);
    System.debug('inside case trigger-end');
    System.debug(sr2);
    
}