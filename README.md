# Event Management System

## Overview
The Event Management System is a comprehensive web application designed to streamline the process of event planning and management. It provides a platform for users to book events, manage venues, and handle catering services. The system includes features for both administrators and regular users, with different levels of access and functionality.

## Technical Specifications

### Technology Stack
- **Backend Framework**: Spring Boot 2.6.1
- **Frontend**: JSP (JavaServer Pages)
- **Database**: MySQL
- **Java Version**: 17
- **Build Tool**: Maven
- **Additional Libraries**:
  - Spring Data JPA
  - Spring Web
  - Spring Mail
  - Apache POI (Excel export)
  - OpenPDF (PDF export)
  - Lombok
  - JSTL

### Key Features
- User Authentication and Authorization
- Event Booking Management
- Hotel/Venue Management
- Catering Services Management
- PDF and Excel Report Generation
- Email Notifications
- Admin Dashboard
- User Dashboard

## Stakeholders
1. **Administrators**
   - Manage users, events, hotels, and catering services
   - Generate reports
   - Monitor bookings and payments

2. **Event Organizers/Users**
   - Book events
   - View available venues and catering services
   - Manage their bookings
   - Update personal information

3. **Venue/Hotel Managers**
   - Manage venue availability
   - Update venue details
   - Track bookings

4. **Catering Service Providers**
   - Manage catering packages
   - Update menu options
   - Track orders

## Installation and Setup

### Prerequisites
- Java 17 or higher
- MySQL Server
- Maven
- Git

### Windows Setup
1. Clone the repository:
   ```bash
   git clone [repository-url]
   ```

2. Configure MySQL:
   - Install MySQL Server if not already installed
   - Create a database named `event_management_system`
   - Update `application.properties` with your MySQL credentials:
     ```
     spring.datasource.username=your_username
     spring.datasource.password=your_password
     ```

3. Build the project:
   ```bash
   mvn clean install
   ```

4. Run the application:
   ```bash
   mvn spring-boot:run
   ```

5. Access the application:
   - Open browser and navigate to `http://localhost:8080`

### Mac Setup
1. Clone the repository:
   ```bash
   git clone [repository-url]
   ```

2. Configure MySQL:
   - Install MySQL using Homebrew:
     ```bash
     brew install mysql
     ```
   - Start MySQL service:
     ```bash
     brew services start mysql
     ```
   - Create database and update credentials as mentioned in Windows setup

3. Build and run:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

4. Access the application:
   - Open browser and navigate to `http://localhost:8080`

## Project Structure
```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── app/
│   │           └── demo/
│   │               ├── controller/
│   │               ├── model/
│   │               ├── repository/
│   │               ├── services/
│   │               └── EventManagementSystemApplication.java
│   ├── resources/
│   │   └── application.properties
│   └── webapp/
│       └── views/
└── test/
```

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
[Add your license information here]

## Contact
[Add your contact information here] 
