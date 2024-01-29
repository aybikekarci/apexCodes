//  A query to get the call and annual sales of all accounts. Then use a for loop to iterate thru every account, printing the call and annual sales of every account to the debug log.

public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Id, AnnualRevenue, Name FROM Account];
        for (Account acc: accountsList){
            string acctRev = acc.Name + ':' + acc.AnnualRevenue;
            system.debug('acctRev'+ acctRev);
        }
    }

// To discover residences indexed with an app Realty within the remaining 30 days.

public class PropertyUtility {
    public static void newListedProperties(){
        List<Property__c> newPropList = new List<Property__c>();
        newPropList = [SELECT Broker__r.Email__c, Id, Name, Days_On_Market__c FROM Property__c WHERE Days_On_Market__c <=30];
        
        for(Property__c p: newPropList){
            String propEmail = p.Name + ':' + p.Broker__r.Email__c;
            system.debug(propEmail);
        }
    }
}
