global class ContactBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        AsyncApexJob[] apexJobs = [select id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed, TotalJobItems, Status, JobType 
                                   From AsyncApexJob
                                   Where Id=:bc.getJobId()];
        
        DebugLine__c dl = new DebugLine__c();
        dl.line__c = 'Apex Jobs in Start method' + apexJobs;
        
        insert dl;
        
        System.debug('Database.BatchableContext =' + bc);
        String query = 'SELECT id,name,fax,email,MobilePhone, Description, Account.Name, Account.Rating, Account.Phone, Account.Fax, Account.Industry from Contact';
        return Database.getQueryLocator(query);    
    } 
    
    global void execute(Database.BatchableContext bc, List<Contact> contactList) {

        AsyncApexJob[] apexJobs = [select id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed, TotalJobItems, Status, JobType 
									From AsyncApexJob
									Where Id=:bc.getJobId()];
        
        DebugLine__c dl = new DebugLine__c();
        dl.line__c = 'Apex Jobs in Execute method' + apexJobs;
        
        insert dl;
        
        Integer size=contactList.size();
        
        for(Integer i=0;i<size;i++){
            Contact con = contactList.get(i);
            
            if(con.fax==null || con.fax==''){
                con.fax = con.account.fax;
            }
            
            if(con.MobilePhone==null || con.MobilePhone==''){
                con.MobilePhone = con.account.Phone;
            }
            con.Email = 'dineshkhamele@gmail.com';
            con.Description= con.Account.Name + ' ' + con.Account.Rating  + ' ' + con.Account.Industry  + ' ' + con.Email ;
        }
        update contactList;
    }
    
    global void finish(Database.BatchableContext bc){
        
        AsyncApexJob[] apexJobs = [select id, ApexClassId, ApexClass.Name, NumberOfErrors, JobItemsProcessed, TotalJobItems, Status, JobType 
									From AsyncApexJob
									Where Id=:bc.getJobId()];
        
        DebugLine__c dl = new DebugLine__c();
        dl.line__c = 'Apex Jobs in Finish method' + apexJobs;
        
        insert dl;
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        email.setSubject('Status of Batch Class: ContactBatch');
        email.setSenderDisplayName('Dinesh Khamele');
        email.setHtmlBody('Dear user, Batch Processed');
        
        List<String> emailTo = new List<String>();
        emailTo.add('dineshkhamele@gmail.com');
        
        email.setToAddresses(emailTo);    
        
        Messaging.SingleEmailMessage[] emailList = new List<Messaging.SingleEmailMessage>();
        emailList.add(email);
        
        Messaging.sendEmail(emailList,false);
    } 
}