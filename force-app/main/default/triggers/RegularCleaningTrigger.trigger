trigger RegularCleaningTrigger on Booking__c (after insert) { 

   List<Housekeeping__c> roomHousekeeping = new List<Housekeeping__c>(); 

 

    Set<Id> roomIds = new Set<Id>(); 

    List<Date> bookingDates = new List<Date>(); 

 

    for (Booking__c booking : Trigger.new) { 

        roomIds.add(booking.Rooms__c); 

        bookingDates.add(booking.Check_in__c); 

    } 

 

    // Map to store existing housekeeping records for room and date combinations 

    Map<String, Housekeeping__c> existingHousekeepingMap = new Map<String, Housekeeping__c>(); 

 

    // Query existing housekeeping records for room and date combinations 

    List<Housekeeping__c> existingHousekeeping = [SELECT Id, Room__c, Housekeeping_Date__c FROM Housekeeping__c WHERE Room__c IN :roomIds AND Housekeeping_Date__c IN :bookingDates]; 

 

    // Populate the existing housekeeping map 

    for (Housekeeping__c hk : existingHousekeeping) { 

        String key = hk.Room__c + '_' + hk.Housekeeping_Date__c; 

        existingHousekeepingMap.put(key, hk); 

    } 

 

    Map<Id, Contact> housekeeperMap = new Map<Id, Contact>([SELECT Id, AccountId FROM Contact WHERE FirstName LIKE 'Housekeeper%']); 

 

    for (Booking__c booking : Trigger.new) { 

         

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

                String key = roomId + '_' + currentDate; 

 

                // Check if housekeeping record already exists for the room and date combination 

                if (!existingHousekeepingMap.containsKey(key)) { 

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

    if (!roomHousekeeping.isEmpty()) { 

        insert roomHousekeeping; 

    } 

}