# sample_api_integeration_riverpod
This repository contains the code for the Flutter Developer Assessment. The app demonstrates a structured integration of Riverpod for state management, showcasing basic views for API integration to display a passenger list. Additionally, it includes functionality for creating and deleting journeys, dynamically updating the passenger view.


# Documentation: Passenger API Integration with Riverpod 2.0 in Flutter Assessment
 # Objective
To develop a Flutter application that integrates the Passenger API, supports pagination, and implements dynamic passenger ticket creation and deletion. The solution uses Riverpod 2.0 for efficient state management based on object comparison and Equatable for state consistency checks.

# Key Implementation Details
1. Passenger API Integration
   Features:
   List fetching with pagination.
   CRUD operations: dynamic passenger ticket creation and deletion.
   Data Modeling:
   Created models for Passenger and Airline using Dart.
   
2. State Management with Riverpod 2.0
   Riverpod Notifier:
   
3. Pagination Handling
   Fetched passengers based on the current page and appended them to the existing list.
   
4. Equatable for Object Comparison
   Used Equatable for state comparison to ensure UI re-renders only when data changes.
   
5. CRUD Operations
   Create: Added passengers dynamically to the list.
   Delete: Removed passengers from the list based on their ID.
6. UI Integration
   List Rendering:

Displayed a paginated list of passengers using ListView.builder.
Triggered state updates through the Riverpod passengerProvider.
CRUD Actions:

Provided buttons for adding and deleting passengers. 
Used Riverpod state to dynamically update the UI.
Conclusion
This implementation showcases:

Clean separation of concerns (API, state, UI).
Efficient state management using Riverpod 2.0 and Equatable.
Support for pagination and dynamic CRUD operations.