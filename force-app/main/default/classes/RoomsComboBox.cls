public class RoomsComboBox {
@AuraEnabled
    public static List<Room__c> getRooms(){
        List<Room__c> roomList=[SELECT Id, Name from Room__c];
        return roomList;
    }
    
}