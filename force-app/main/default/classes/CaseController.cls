public with sharing class CaseController {
    @AuraEnabled
    public static Id createCase(Id roomNumber, String repairType, String malfunctionSubject, String description, Id contactId, String failureCondition) {
        Case newCase = new Case();
        newCase.Subject = malfunctionSubject;
        newCase.Description = description;
        newCase.Room__c = roomNumber;
        newCase.Repair_type__c = repairType;
        newCase.Failure_condition__c=failureCondition;
        newCase.ContactId = contactId; 
        
        if(roomNumber!=null){
               
      Room__c room = [SELECT Id, Status__c FROM Room__c WHERE Id = :roomNumber];
       room.Status__c = 'Not available';
        update room;        
           }
        
        insert newCase;
        return newCase.Id;
    }
    
    @AuraEnabled
    public static List<Room__c> getRooms(){
        List<Room__c> roomList=[SELECT Id, Name from Room__c];
        return roomList;
    }
        @AuraEnabled
    public static List<Contact> getContacts() {
        return [SELECT Id, LastName FROM Contact where RecordType.DeveloperName='Regular_Contact'];
    }
   @AuraEnabled
    public static List<Contact> getRepairMen(String repairType){
        List<Contact> contacts=[SELECT Id, Name, Phone, Review__c from Contact where Repair_Type_Speciality__c=:repairType AND RecordType.DeveloperName='Repair_Contact'];
        return contacts;
    }
}