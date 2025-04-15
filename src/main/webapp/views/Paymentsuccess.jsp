<%if (session.getAttribute("User_email") == null) {response.sendRedirect("/signin"); } else {%> 
<jsp:include page="includes/header.jsp" />  
<nav class="navbar navbar-expand-md navbar-dark bg-dark" style="margin-bottom:20px">
    <div class="container-fluid">
      <a class="navbar-brand" href="/userbookingdetails"><i class="fas fa-backward"></i> Back</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
     </div>
  </nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-body p-5">
                    <div class="text-center mb-4">
                        <i class="fas fa-check-circle text-success" style="font-size: 4rem;"></i>
                        <h2 class="card-title mt-3">Payment Successful!</h2>
                        <p class="text-muted">Your payment has been processed successfully.</p>
                    </div>
                    
                    <div class="booking-details">
                        <h4 class="mb-3">Booking Details</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Booking ID:</strong> ${booking_id}</p>
                                <p><strong>Hotel:</strong> ${booking.hotel.hotelName}</p>
                                <p><strong>Event:</strong> ${booking.event.eventname}</p>
                                <p><strong>Catering:</strong> ${booking.catering.catername}</p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Event Date:</strong> ${booking.event_date}</p>
                                <p><strong>Event Time:</strong> ${booking.start_at}</p>
                                <p><strong>No. of Guests:</strong> ${booking.no_of_guest}</p>
                                <p><strong>Amount Paid:</strong> Rs. ${amount}</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-center mt-4">
                        <a href="/userbookingdetails" class="btn btn-primary">
                            <i class="fas fa-arrow-left me-2"></i>Back to Bookings
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />  
<%}%> 