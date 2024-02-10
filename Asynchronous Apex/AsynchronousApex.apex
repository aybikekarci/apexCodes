// Create an Apex class with a future method that accepts a List of Account IDs and updates a custom field on the Account object with the number of contacts associated to the Account. 

// in Apex Class on AccountProcessor

public class AccountProcessor {
    @future
    public static void countContacts(List<Id>accountIds){
        List<Account> accounts = [Select Id, Name from Account Where Id IN: accountIds];
        List<Account> updatedAccounts = new List<Account>();
        for(Account account : accounts){
            account.Number_of_Contacts__c = [Select count() from Contact Where AccountId =: account.Id];
             System.debug('No of Contacts = ' + account.Number_of_Contacts__c);
             updatedAccounts.add(account);
        }
        update updatedAccounts;
    }
}

// Later for Test, create Apex class named as AccountProcessorTest

@isTest
public class AccountProcessorTest {
    @isTest
    public static void testNoOfContacts(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName =  'Willie';
        c.AccountId = a.Id;
        
        Contact c2 = new Contact();
        c2.FirstName = 'Tom';
        c2.LastName = 'Cruise';
        c2.AccountId = a.Id;
        
        List<Id> acctIds = new List<Id>();
        acctIds.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();
    }

}

// Create an Apex class that implements the Database.Batchable interface to update all Lead records in the org with a specific LeadSource. 

public class LeadProcessor implements Database.Batchable<sObject> { // 
   
     public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
          return Database.getQueryLocator([Select LeadSource From Lead ]);
    }
    public void execute(Database.BatchableContext bc, List<Lead> leads){
         // process each batch of records
            for (Lead Lead : leads) {
                lead.LeadSource = 'Dreamforce';
            }
        update leads;
    }    
    public void finish(Database.BatchableContext bc){
      }

}

// in apex class test:

@isTest
public class LeadProcessorTest {
    
        @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for(Integer counter=0 ;counter <200;counter++){
            Lead lead = new Lead();
            lead.FirstName ='FirstName';
            lead.LastName ='LastName'+counter;
            lead.Company ='demo'+counter;
            leads.add(lead);
        }        
        insert leads;
    }
    
    @isTest static void test() {
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();   
    }

}
