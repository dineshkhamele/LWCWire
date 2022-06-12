trigger ContactTrigger on Contact (after insert, after update) {
  
/*
     
 String body='{"Employees": [';
 Integer counter=0;
    
 for (Contact objContact : Trigger.new) {
        //make webservice callout 
        
     System.debug(objContact);
     
    if (counter > 0) 
      body += ',';
     
    Account accountRecord = [SELECT AccountNumber FROM Account WHERE Id = :objContact.AccountID Limit 1];
     
    //Firstname, Lastname, (Firstname+AccountID), email id

     body += '{' 
              + '"accountid":'
              + '"' + accountRecord.AccountNumber + '"' + ','
              + '"firstname":'
              + '"' + objContact.FirstName + '"' + ','
              + '"lastname":'
              + '"' + objContact.LastName + '"' + ','
              + '"Email":'
              + '"' + objContact.email + '"' 
         + '}';
     
         counter++;
    }
     
    body+=']}';
    System.Debug(body);     
    ContactTriggerHandler.sendContactInfo(body);

*/
}