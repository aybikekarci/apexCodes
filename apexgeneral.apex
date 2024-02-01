// this method gets the first FIVE Account records ordered BY THE DATE created

    public static void updateOlderAccounts() {
      // Get the 5 oldest accounts
      Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
      // loop through them and update the Description field
      for (Account acct : oldAccounts) {
          acct.Description = 'Heritage Account';
      }
      // save the change you made
      update oldAccounts;
    }

// by using a WHILE, print the following image:
Q-Q-Q-Q
Q-Q-Q
Q-Q
Q

Integer numLines = 4;
Integer numQ = numLines;

while (numQ > 0) {
    String line = '';
    for (Integer i = 0; i < numQ; i++) {
        line += 'Q';
        if (i < numQ - 1) {
            line += '-';
        }
    }
    System.debug(line);
    numQ--;
}
