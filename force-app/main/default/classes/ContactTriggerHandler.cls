public class ContactTriggerHandler {
     
    static final string endPoint = 'https://prod-63.eastus.logic.azure.com:443/workflows/6522e4d534fb4336b92e025b3a27528d/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=tWloRyFK1bOIiIfpnROZ7dcQTRSMEDeQR8fVuZVD-3M';
    
    @future (callout=true)
    public static void sendContactInfo(string body) {
        try{
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();

            request.setEndpoint(endPoint);
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('POST');
            request.setBody(body);
           
            response = http.send(request);

            System.debug('Request= ' + request);
            System.debug('Response= ' + response);

            if (response.getStatusCode() == 200 || response.getStatusCode() == 201 || response.getStatusCode() == 202) {
                System.debug('Response-' + response);
            }
        }
        catch(System.CalloutException e){
            System.debug('Error-' + e.getMessage());   
        }
    }
}