//  A query to get the call and annual sales of all accounts. Then use a for loop to iterate thru every account, printing the call and annual sales of every account to the debug log.

public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Id, AnnualRevenue, Name FROM Account];
        for (Account acc: accountsList){
            string acctRev = acc.Name + ':' + acc.AnnualRevenue;
            system.debug('acctRev'+ acctRev);
        }
    }
