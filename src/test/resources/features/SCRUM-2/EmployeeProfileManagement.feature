### Feature: Employee Profile Management

#### Scenario: Upload a valid profile picture
   Given the admin is on the "Add Employee" form
   And the "Upload Profile Picture" field is visible
   When the admin uploads a file with a `.jpg`, `.png`, or `.gif` extension and size less than or equal to 1MB
   Then the profile picture should be successfully uploaded
   And a preview of the uploaded image should be displayed

#### Scenario: Upload an invalid profile picture (unsupported file type)
   Given the admin is on the "Add Employee" form
   And the "Upload Profile Picture" field is visible
   When the admin uploads a file with an unsupported extension (e.g., `.pdf`, `.docx`)
   Then an error message should display saying "Unsupported file type. Please upload a .jpg, .png, or .gif file."

#### Scenario: Upload an invalid profile picture (file size exceeds limit)
   Given the admin is on the "Add Employee" form
   And the "Upload Profile Picture" field is visible
   When the admin uploads a file larger than 1MB
   Then an error message should display saying "File size exceeds 1MB. Please upload a smaller file."

#### Scenario: Input employee's full name
   Given the admin is on the "Add Employee" form
   When the admin enters a valid First Name, optional Middle Name, and Last Name
   Then the form should accept the input without errors

#### Scenario: Submit the form without entering mandatory name fields
   Given the admin is on the "Add Employee" form
   When the admin leaves the First Name or Last Name field empty
   And clicks the "Save" button
   Then an error message should display saying "First Name and Last Name are required."

#### Scenario: Assign a unique Employee ID
   Given the admin is on the "Add Employee" form
   And the "Employee ID" field is visible
   When the admin enters a unique Employee ID
   Then the form should accept the input without errors

#### Scenario: Assign a duplicate Employee ID
   Given the admin is on the "Add Employee" form
   And the "Employee ID" field is visible
   When the admin enters an Employee ID that already exists in the system
   Then an error message should display saying "Employee ID must be unique."

#### Scenario: Enable login credentials creation
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is visible
   When the admin toggles the switch to "On"
   Then the fields for "Username," "Password," and "Confirm Password" should become visible

#### Scenario: Disable login credentials creation
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is visible
   When the admin toggles the switch to "Off"
   Then the fields for "Username," "Password," and "Confirm Password" should be hidden

#### Scenario: Specify a unique username
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is set to "On"
   When the admin enters a unique username
   Then the form should accept the input without errors

#### Scenario: Specify a duplicate username
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is set to "On"
   When the admin enters a username that already exists in the system
   Then an error message should display saying "Username must be unique."

#### Scenario: Set a valid password
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is set to "On"
   When the admin enters a password that meets the security requirements
   And enters the same value in the "Confirm Password" field
   Then the form should accept the input without errors

#### Scenario: Set an invalid password
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is set to "On"
   When the admin enters a password that does not meet the security requirements
   Then an error message should display saying "Password must include uppercase, lowercase, numbers, and symbols."

#### Scenario: Password and Confirm Password do not match
   Given the admin is on the "Add Employee" form
   And the "Create Login Credentials" toggle is set to "On"
   When the admin enters a password in the "Password" field
   And a different value in the "Confirm Password" field
   Then an error message should display saying "Password and Confirm Password do not match."

#### Scenario: Set account status to Enabled
   Given the admin is on the "Add Employee" form
   When the admin views the "Account Status" toggle
   Then the toggle should be set to "Enabled" by default

#### Scenario: Toggle account status to Disabled
   Given the admin is on the "Add Employee" form
   When the admin toggles the "Account Status" switch to "Disabled"
   Then the account status should be updated to "Disabled"

#### Scenario: Save employee details successfully
   Given the admin has filled out all required fields correctly
   When the admin clicks the "Save" button
   Then the employee's details should be stored in the system
   And the form should reset for adding another employee

#### Scenario: Attempt to save with missing required fields
   Given the admin is on the "Add Employee" form
   When the admin leaves any required field empty
   And clicks the "Save" button
   Then an error message should display saying "Please fill out all required fields."

#### Scenario: Cancel the operation
   Given the admin is on the "Add Employee" form
   When the admin clicks the "Cancel" button
   Then all entered information should be cleared
   And the admin should be navigated to the previous screen or dashboard

#### Scenario: Display validation errors during form submission
   Given the admin is on the "Add Employee" form
   When the admin submits the form with invalid or missing data
   Then specific error messages should display for each invalid field
   And the form should not be submitted until all errors are resolved