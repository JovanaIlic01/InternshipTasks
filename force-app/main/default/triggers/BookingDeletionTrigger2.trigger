trigger BookingDeletionTrigger2 on Booking__c (before delete) {
/*
    for(Booking__c triggeredBooking:Trigger.old){
        
List<Room__c> rooms=[SELECT ID,Status__c,Hotel__c,Max_Availability__c, Name FROM Room__c WHERE Id=:triggeredBooking.Rooms__c LIMIT 1];
   Room__c room=rooms[0];
        Decimal guestNumber=triggeredBooking.Number_of_guests__c;


   
     if(room.Status__c=='Not available'){
            Booking__c newBooking=new Booking__c();
            
            RoomAvailability ra=new RoomAvailability();
			newBooking.Rooms__c=ra.findAvailableRooms(room, guestNumber);
            newBooking.Contact__c = triggeredBooking.Contact__c;
            newBooking.Check_in__c = triggeredBooking.Check_in__c;
            newBooking.Check_out__c = triggeredBooking.Check_out__c;
            newBooking.Number_of_guests__c =triggeredBooking.Number_of_guests__c;
         
         
                 insert newBooking;
         
         //email alert da se posalje da im je soba promenjena:
         List<EmailTemplate> emailTemplates = [SELECT Id, Body, Subject from EmailTemplate where DeveloperName = 'Room_chaged_template'];

Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTemplateId(emailTemplates[0].Id);
mail.setSaveAsActivity(false);
mail.setTargetObjectId(triggeredBooking.Contact__c);
         List<Contact> contactEmails=[SELECT ID, Email FROM Contact WHERE ID=:triggeredBooking.Contact__c LIMIT 1];
         Contact c=contactEmails[0];
         String[] toAddress=new String[]{c.Email};
mail.setToAddresses(toAddress);
mail.setWhatId(newBooking.Rooms__c); 
Messaging.SendEmailResult[] resultMail = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 }
     
        
    }
    */
    
    
    
}