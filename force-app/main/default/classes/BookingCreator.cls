public class BookingCreator {

    @InvocableMethod(label='Create a Booking' description='Creates a  booking')
    public static void createHotelBooking(List<HotelBookingInput> bookingInputs) {
       //pravi se lista bukinga koji trebaju da se kreiraju
        List<Booking__c> bookingsToCreate = new List<Booking__c>();
        
        
        for (HotelBookingInput input : bookingInputs) {
           Booking__c booking = new Booking__c();
            booking.Rooms__c = input.Room;
            booking.Contact__c = input.Contact;
            booking.Check_in__c = input.CheckInDate;
            booking.Check_out__c = input.CheckOutDate;
            booking.Number_of_guests__c = input.NumberOfGuests;
            
            bookingsToCreate.add(booking);
        }
        
        if (!bookingsToCreate.isEmpty()) {
            insert bookingsToCreate;
        }
        
        
    }

    
    
    public class HotelBookingInput {
        @InvocableVariable(label='Room' description='Booking Room')
        public String Room;
        
        @InvocableVariable(label='Contact' description='Booking contact')
        public String Contact;
        
        @InvocableVariable(label='Check-in Date' description='Check in date')
        public Date CheckInDate;
        
        @InvocableVariable(label='Check-out Date' description='Check-out date')
        public Date CheckOutDate;
        
        @InvocableVariable(label='Number of Guests' description='Number of guests')
        public Decimal NumberOfGuests;
    }
    
  
}