// If the code written in Opportunity doesn't work, we want the contact or account to work with the code written later.

Try{

Opportunity MyOpp= new Opportunity();
MyOpp.name= ‘newOpp’;
MyOpp.stageName= ‘prospecting’;
// myOpp.CloseDate= Date.today()+30;
Insert myOpp;

} Catch(DmlException e ){ system.debug(‘there is a DML Exception’+ e.getMessage);

}

Contact con= new Contact();
Con.FirstName=’Jack’;
Con.LastName=Merry;
Insert con;

System.debug(‘ a new contact has been created ’);
