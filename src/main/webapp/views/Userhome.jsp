<%if (session.getAttribute("User_email") == null) {response.sendRedirect("/signin"); } else {%>
  <jsp:include page="includes/header.jsp" />
  <jsp:include page="includes/userNav.jsp" />

  <style>
    .stats-card {
      height: 100%;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
      margin-bottom: 20px;
    }

    .stats-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
      cursor: pointer;
    }

    .stats-card .card-body {
      padding: 20px;
      display: flex;
      align-items: center;
    }

    .stats-card .icon-container {
      width: 70px;
      height: 70px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 15px;
    }

    .stats-card .icon-bg-warning {
      background-color: rgba(255, 187, 51, 0.2);
    }

    .stats-card .icon-bg-success {
      background-color: rgba(40, 167, 69, 0.2);
    }

    .stats-card .icon-bg-danger {
      background-color: rgba(220, 53, 69, 0.2);
    }

    .stats-card .icon-bg-info {
      background-color: rgba(23, 162, 184, 0.2);
    }

    .stats-card .stats-number {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .stats-card .stats-title {
      font-size: 14px;
      color: #6c757d;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .dashboard-header {
      padding: 20px 0;
      border-bottom: 1px solid #eee;
      margin-bottom: 20px;
    }
  </style>

  <!-- Page Content  -->
  <div id="content">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-info">
          <i class="fas fa-align-left"></i>
          <span>Toggle Sidebar</span>
        </button>
        <div>
          <h3 class="text-info">USER DASHBOARD</h3>
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

    <div class="container-fluid">
      <div class="dashboard-header">
        <h4 class="text-uppercase">Dashboard Overview</h4>
        <p>Your booking statistics at a glance</p>
      </div>

      <div class="row">
        <!-- Hotels Card -->
        <div class="col-xl-3 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-warning">
                <i class="fas fa-concierge-bell text-warning fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-success">${user_hotel_count}</div>
                <div class="stats-title">Total Hotels</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Events Card -->
        <div class="col-xl-3 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-success">
                <i class="fas fa-birthday-cake text-success fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-primary">${user_event_count}</div>
                <div class="stats-title">Total Events</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Caterings Card -->
        <div class="col-xl-3 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-danger">
                <i class="fas fa-utensils text-danger fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-warning">${user_catering_count}</div>
                <div class="stats-title">Total Caterings</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Total Bookings Card -->
        <div class="col-xl-3 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-info">
                <i class="fas fa-calendar-check text-info fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-success">${user_booking_count}</div>
                <div class="stats-title">Total Bookings</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row mt-4">
        <!-- Bookings Cancelled by Admin -->
        <div class="col-xl-6 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-warning">
                <i class="fas fa-calendar-times text-warning fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-warning">${user_bookingcancelbyadmin_count}</div>
                <div class="stats-title">Bookings Cancelled by Admin</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Bookings Cancelled by User -->
        <div class="col-xl-6 col-md-6 col-sm-12">
          <div class="card stats-card">
            <div class="card-body">
              <div class="icon-container icon-bg-danger">
                <i class="fas fa-calendar-times text-danger fa-2x"></i>
              </div>
              <div class="stats-details">
                <div class="stats-number text-danger">${user_bookingcancelbyuser_count}</div>
                <div class="stats-title">Bookings Cancelled by User</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="includes/footer.jsp" />
<%}%>