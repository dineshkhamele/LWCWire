public class SObjectDemo {

    public static void DoSomething(){
    List<sObject> theList;
    String theObject = 'Contact';
    String nameFieldName = 'Name';
    String accNumFieldName = 'Account_Number__c'; 
    if(theObject == 'Account'){
        theList = [SELECT AccountNumber, Name FROM ACCOUNT];
    }
    else{
         theList = [SELECT Account_Number__c, Name FROM CONTACT];
    }
     
    ProcessList(theList,nameFieldName,accNumFieldName);    
}

    public static void ProcessList(List<sobject> theList, String nameFieldName, String accNumFieldName){
        for(sobject item:theList){
            System.debug((String) item.get(nameFieldName) + ' ' + (String) item.get(accNumFieldName));
        }
    } 
}