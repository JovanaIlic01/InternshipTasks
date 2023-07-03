public class RoomAvailability {
    public String findAvailableRooms(Room__c room, Decimal guestNum){
        
        List<Room__c> availableRooms=[SELECT ID, Status__c, Hotel__c,Max_Availability__c  FROM Room__c
                           WHERE Status__c='Available'
                           AND Hotel__c=:room.Hotel__c
                           AND Max_Availability__c>=:guestNum
                           LIMIT 1];
        if(!availableRooms.isEmpty()){
           String roomID=availableRooms.get(0)?.ID;
        return roomID;
        }
        else return null;
    }
    
  
}