public class RegularRoomCleaning implements Schedulable { 

public void execute(SchedulableContext sc) { 

         

        // Active bookings 

        List<Booking__c> bookings = [SELECT Id, Rooms__c, Check_in__c, Check_out__c, Hotel__c FROM Booking__c WHERE Active_booking__c = true]; 

 

        // List of housekeeping records 

        List<Housekeeping__c> roomHousekeeping = new List<Housekeeping__c>(); 

              

        Map<Id, Contact> housekeeperMap = new Map<Id, Contact>([SELECT Id, AccountId FROM Contact WHERE FirstName LIKE 'Housekeeper%']); 

 

    	for (Booking__c booking : bookings) { 

         

        // Booking room and hotel 

        Id roomId = booking.Rooms__c; 

        String hotel = booking.Hotel__c; 

 

        Contact housekeeper = new Contact(); 

        for (Contact contact : housekeeperMap.values()) { 

            if (contact.AccountId == hotel) { 

                housekeeper = contact; 

                break; 

            } 

        } 

 

            if (housekeeper != null) {               

                // Creating housekeeping for every day of booking except the last day 

                Date currentDate = booking.Check_in__c; 

                 

                while (currentDate < booking.Check_out__c) { 

                    // Check if housekeeping record already exists for the room and date 

                    List<Housekeeping__c> existingCleanings = [SELECT Id FROM Housekeeping__c WHERE Room__c = :roomId AND Housekeeping_Date__c = :currentDate LIMIT 1]; 

                     

                    if (existingCleanings.isEmpty()) { 

                        Housekeeping__c cleaning = new Housekeeping__c(); 

                        cleaning.Room__c = roomId; 

                        cleaning.Cleaning_Lady__c = housekeeper.Id; 

                        cleaning.Housekeeping_Date__c = currentDate; 

                        cleaning.Type__c = 'Regular'; 

                        cleaning.Booking__c = booking.Id; 

 

                        roomHousekeeping.add(cleaning); 

                    } 

                     

                    currentDate = currentDate.addDays(1); 

                } 

            } 

        } 

 

        // Inserting Housekeeping records 

        insert roomHousekeeping; 

    } 

}