// If you create a new account and it is left empty, we will put a validation rule that prevents it from being left empty and give a message

trigger AccountPhone on Account (before insert) {

    for (Account acc : trigger.new){
        if(string.isEmpty(acc.phone)){
            acc.addError('Please, enter a phone number');
        }
    }
}
