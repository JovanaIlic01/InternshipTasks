public class ContactNameController {
@AuraEnabled
    public static List<Contact> getContactLastName(){
        List<Contact> contactList=[SELECT Id, Name from Contact];
        return contactList;
    }
    
}