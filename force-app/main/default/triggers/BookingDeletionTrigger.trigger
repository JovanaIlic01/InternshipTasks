trigger BookingDeletionTrigger on Booking__c (before delete) {    
  /*   
    for(Booking__c b:Trigger.old){
        
        //izvlacim sobu i prosledjujm metodi da mi nadje novu Available sobu
        ////al opet mi je SOQL u for petlji
   List<Room__c> rooms=[SELECT ID, Name FROM Room__c WHERE Id=:b.Rooms__c LIMIT 1];
   Room__c roomOnRepair=rooms[0];
        
       //instanca klase sa metodama: 
   //     BookingCreator createABooking=new BookingCreator();
   
        
        //pravi se input lista za invocable metodu:
List<BookingCreator.HotelBookingInput> bookings = new List<BookingCreator.HotelBookingInput>();
        
        //input parametri:
BookingCreator.HotelBookingInput bookingInput = new BookingCreator.HotelBookingInput();
bookingInput.Room =BookingCreator.findAvailableRoom(roomOnRepair);
bookingInput.Contact = b.Contact__c;
bookingInput.CheckInDate = b.Check_in__c;
bookingInput.CheckOutDate = b.Check_out__c;
bookingInput.NumberOfGuests =b.Number_of_guests__c;

//dodaju se input paraametri u listu invocable metode:
bookings.add(bookingInput);
        
    }*/
}