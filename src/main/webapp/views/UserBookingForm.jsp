<%if (session.getAttribute("User_email") == null) {
	response.sendRedirect("/signin");
} else {%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />  

<jsp:include page="includes/userNav.jsp" />  


<!-- Page Content  -->
<div id="content">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">

			<button type="button" id="sidebarCollapse" class="btn btn-info">
				<i class="fas fa-align-left"></i>
				<span>Toggle Sidebar</span>
			</button>
		   <div>
				<h3 class="text-info">BOOK YOUR EVENTS</h3>
			</div>
			<div>
				<p>Welcome 
				<% if(session.getAttribute("User_gender").equals("male")){ %> 
					Mr.
				<%}else{%> 
					Miss.
				<%}%> 
				<span class="font-weight-bold text-info">${User_firstname} ${User_lastname}</span></p>
			</div>
		</div>
	</nav>

<div>
	   

   
<section class="container ">
  <div class="container">
		<div class="row align-items-center my-5">
				

				<!-- Booking Form -->
				<div class="col-md-12 ">
				   <form action="/makeBookingForm" modelAttribute="makeBookingForm" method="POST">
						   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="user_id" value="${User_id}"/>
						<input type="hidden" name="current_date" id="current_date" value=""/>
						<div class="row">
							<!-- First Name -->
							
								<div class="col-lg-5 col-md-5 col-sm-12 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputEmail1">Email address</label>
										<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" value="${User_email}" readonly/>
										<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
									  </div>
								</div>

								<div class="col-lg-5 col-md-5 col-sm-12 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Phone Number</label>
										<input type="tel" class="form-control" id="contactno" name="contactno" placeholder="phoneNumber" value="${User_phone}" readonly>
									  </div>
								</div>
								
								<div class="col-lg-5 col-md-5 col-sm-5 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Event Date</label>
										<input type="date" id="event_date" name="event_date" class="form-control" onchange="validatedate();" required>
									</div>
								</div>

								<div class="col-lg-5 col-md-5 col-sm-5 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Event	Starting Time</label>
										<input type="time" id="start_at" name="start_at" class="form-control" required>
									</div>
								</div>

								
								<div class="col-lg-10 col-md-10 col-sm-12 mb-2 ml-2">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Event Type</label>
										<select id="event_book" name="event_id" class="form-control" required>
											<option value="">Choose the Event</option>
											<c:forEach var="eventData" items="${event_for_booking}">
												<option id="${eventData.id}" value="${eventData.id}">${eventData.eventname}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-lg-5 col-md-5 col-sm-12 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Hotel</label>
										<select id="hotel_book" name="hotel_id" class="form-control" required>
											<option value="">Choose the Hotel</option>
											<c:forEach var="hotelData" items="${hotel_for_booking}" >
												<option id="${hotelData.id}" value="${hotelData.id}">${hotelData.hotelName} - Per Hour Rs.${hotelData.price}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
	
								<div class="col-lg-5 col-md-5 col-sm-12 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Catering Type</label>
										<select id="catering_book" name="catering_id" class="form-control" required>
											<option value="">Choose the Catering</option>
											<c:forEach var="caterData" items="${catering_for_booking}">
												<option id="${caterData.id}" value="${caterData.id}">${caterData.catername} - Per Person Rs.${caterData.cater_price}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								
								
								<div class="col-lg-5 col-md-5 col-sm-5 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Select Event Timing</label>
										<select id="event_maxhour" name="max_total_hour" class="form-control" required>
											<option value="">Choose the Event Timing</option>
											<option value="2">2hours</option>
											<option value="4">4hours</option>
											<option value="6">6hours</option>
											<option value="8">8hours</option>
											<option value="10">10hours</option>
											<option value="12">12hours</option>
											<option value="14">14hours</option>
											<option value="16">16hours</option>
											<option value="18">18hours</option>
											<option value="20">20hours</option>
											<option value="22">22hours</option>
											<option value="24">24hours</option>
										</select>
									</div>
								</div>
								
								<div class="col-lg-5 col-md-5 col-sm-5 mb-2 ml-3">
									<div class="form-group">
										<label for="exampleInputPassword1">Total Number of Guests / People</label>
										<input type="number" id="no_of_guest" name="no_of_guest" class="form-control" required>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12 mb-2 ml-5 align-items-center">
									<h1 class="text-muted">INVOICE</h1>
									<p class="text-muted">Hotel Price - > <span id="hotel_price"></span> <span id="hours"></span>  <span id="total_amt_hotel"></span></p>
									<p class="text-muted">Catering Price - > <span id="catering_price"></span>  <span id="guest"></span>  <span id="total_amt_cater"></span></p>
								</div>
								<div class="form-group col-lg-5 mx-auto mb-0 align-items-center">
									<span class="btn btn-info btn-block py-2" class="font-weight-bold" name="Calculate" onclick="calc();">Calculate Amount</span>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 mb-2">
									<div class="form-group">
										<label for="exampleInputPassword1">Total Amount</label>
										<input type="text" class="form-control" id="amt" name="amount" value="0" placeholder="Amount" value="" readonly>
									</div>
								</div>
			
							<!-- Submit Button -->
							<div class="form-group col-lg-12 mx-auto mb-0">
								<button type="submit" class="btn btn-info btn-block py-2" name="adduser" onclick="return calc();">
									<span class="font-weight-bold">Book your Event</span>
								</button>
							</div>
					</div>
			 </form>
			</div>
		</div>
	</div>

</section>
	   
</div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();

today = dd + '/' + mm + '/' + yyyy;
// document.write(today);
document.getElementById("current_date").value=today;

$('#hotel_book').change(testMessage);
$('#catering_book').change(testMessage2);
$('#event_maxhour').change(textMessage3);

$("#no_of_guest").on('input',textMessage4);

var hotel_amt=0, catering_amt=0, no_of_guest=1, no_of_hours=1;

function testMessage(){
	
	var id = $(this).children(":selected").attr("id");
	console.log(id);
	var hotel_name="";
	$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/hotelbookfind/"+id, //this is my servlet
			data: "input=" +$('#ip1').val()+"&output="+$('#op1').val(),
			success: function(hotel){      
				  //var result=$('#amt').val(hotel.price);
				hotel_amt=hotel.price;
				hotel_name=hotel.hotelName;
				// alert(hotel_amt);
				$('#hotel_price').text(hotel_amt);
			
				
			}
	});

	var e_date=$("#event_date").val();
	$.ajax({
		type:"GET",
		url: "${pageContext.request.contextPath}/hotelbookingfind/"+id, //this is my servlet
		data: "input=" +$('#ip15').val()+"&output="+$('#op15').val(),
		success: function(book){
			console.log(e_date)
		      
			for(let i=0;i<book.length;i++){
					console.log(book[i].event_date);
					if(e_date==book[i].event_date){
						swal("Alert!", "The Hotel "+hotel_name+" is already booked at the date "+e_date+" Please choose other hotel !", "error");
						$("#hotel_book").val("");
					}
			}
		}
	});
}
function testMessage2(){
	
	var id = $(this).children(":selected").attr("id");
	console.log(id);

	var cater_name="";
	$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/cateringbookfind/"+id, //this is my servlet
			data: "input=" +$('#ip2').val()+"&output="+$('#op2').val(),
			success: function(cater){      
				//  $('#amt').val(cater.price);
				  catering_amt=cater.cater_price;
					// alert(catering_amt);
					cater_name=cater.catername;
				  $('#catering_price').text(catering_amt)
				  
				//   $('#amt').val(result);
			}
	});


	var e_date=$("#event_date").val();
	$.ajax({
		type:"GET",
		url: "${pageContext.request.contextPath}/cateringbookingfind/"+id, //this is my servlet
		data: "input=" +$('#ip16').val()+"&output="+$('#op16').val(),
		success: function(book){
			console.log(e_date)
		      
			for(let i=0;i<book.length;i++){
					console.log(book[i].event_date);
					if(e_date==book[i].event_date){
						swal("Alert!", "The Catering "+cater_name+" is already booked at the date "+e_date+" Please choose other Catering", "error");
						$("#catering_book").val("");
					}
			}
		}
	});

}

function textMessage3(){
	no_of_hours = $(this).children(":selected").val();
	// alert(no_of_hours);
	$("#hours").text(' X '+no_of_hours);
	
}

function textMessage4(){
	no_of_guest = $("#no_of_guest").val();
	$("#guest").text(' X '+no_of_guest);
}

function calc(){
	var hotel = no_of_hours * hotel_amt;
	var cater = no_of_guest * catering_amt;
	var result = hotel + cater;

	$('#total_amt_hotel').text(' = ' + hotel);
	$('#total_amt_cater').text(' = ' + cater);
	$('#amt').val(result);
}

function validatedate(){    
	

    today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //As January is 0.
    var yy = today.getFullYear();

    var  e = document.getElementById('event_date');
    
	var  dateformat = e.value.split('-');
    var  cin=dateformat[2];
    var  cinmonth=dateformat[1];
    var  cinyear=dateformat[0];
    if (yy==cinyear && mm==cinmonth && dd<=cin) { 
   		return true;
		   
    }
    else if(yy<cinyear){
        return true;
		
    }
    else if(mm<cinmonth && yy<=cinyear){
        return true;
		
    }
    
    else {    
		alert("Please select valid appointment date from today");
		e.value ='';
    }    
	
}


</script>
<jsp:include page="includes/footer.jsp" /> 

<%}%>