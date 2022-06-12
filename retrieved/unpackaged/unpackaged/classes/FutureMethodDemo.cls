public class FutureMethodDemo {
    
    @future
    public static void FutureMethod(Integer i){
        System.debug('in Future Method' + i);
        //AnotherFutureMethod(5);
    }

    @future
    public static void AnotherFutureMethod(Integer i){
        System.debug('in another Future Method' + i);
    }

}