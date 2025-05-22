### Feature: Employee Profile Management

#### Scenario: Upload a valid profile picture
   Given the admin is on the "Add Employee" form  
   When the admin uploads a profile picture in `.jpg`, `.png`, or `.gif` format  
   And the file size is less than or equal to 1MB  
   Then the profile picture should be successfully uploaded  

#### Scenario: Upload an invalid profile picture format
   Given the admin is on the "Add Employee" form  
   When the admin uploads a profile picture in a format other than `.jpg`, `.png`, or `.gif`  
   Then an error message should display saying "Invalid file format. Please upload a .jpg, .png, or .gif file."  

#### Scenario: Upload a profile picture exceeding size limit
   Given the admin is on the "Add Employee" form  
   When the admin uploads a profile picture larger than 1MB  
   Then an error message should display saying "File size exceeds 1MB. Please upload a smaller file."  

#### Scenario: Display recommended dimensions for profile picture
   Given the admin is on the "Add Employee" form  
   Then the recommended dimensions for the profile picture should be displayed as "200px X 200px"  

---

### Feature: Employee Full Name Input

#### Scenario: Submit form with all name fields filled
   Given the admin is on the "Add Employee" form  
   When the admin enters a valid First Name, Middle Name, and Last Name  
   Then the form should accept the input  

#### Scenario: Submit form with only First Name and Last Name
   Given the admin is on the "Add Employee" form  
   When the admin enters a valid First Name and Last Name but leaves the Middle Name blank  
   Then the form should accept the input  

#### Scenario: Submit form with missing First Name or Last Name
   Given the admin is on the "Add Employee" form  
   When the admin leaves the First Name or Last Name field blank  
   Then an error message should display saying "First Name and Last Name are required."  

---

### Feature: Assign Unique Employee ID

#### Scenario: Assign a unique Employee ID
   Given the admin is on the "Add Employee" form  
   When the admin enters a unique Employee ID  
   Then the form should accept the input  

#### Scenario: Assign a duplicate Employee ID
   Given the admin is on the "Add Employee" form  
   When the admin enters an Employee ID that already exists in the system  
   Then an error message should display saying "Employee ID must be unique."  

---

### Feature: Create Login Credentials

#### Scenario: Enable login credentials creation
   Given the admin is on the "Add Employee" form  
   And the "Create Login Credentials" toggle is visible  
   When the admin toggles "Create Login Credentials" to enable  
   Then the fields for `Username`, `Password`, and `Confirm Password` should be displayed  

#### Scenario: Disable login credentials creation
   Given the admin is on the "Add Employee" form  
   And the "Create Login Credentials" toggle is visible  
   When the admin toggles "Create Login Credentials" to disable  
   Then the fields for `Username`, `Password`, and `Confirm Password` should be hidden  

---

### Feature: Specify Username

#### Scenario: Enter a unique username
   Given the admin has enabled "Create Login Credentials"  
   When the admin enters a unique username  
   Then the form should accept the input  

#### Scenario: Enter a duplicate username
   Given the admin has enabled "Create Login Credentials"  
   When the admin enters a username that already exists in the system  
   Then an error message should display saying "Username must be unique."  

#### Scenario: Leave the username field blank
   Given the admin has enabled "Create Login Credentials"  
   When the admin leaves the username field blank  
   Then an error message should display saying "Username is required."  

---

### Feature: Set Password

#### Scenario: Enter a valid password and confirm password
   Given the admin has enabled "Create Login Credentials"  
   When the admin enters a valid password that meets security requirements  
   And the admin enters the same value in the "Confirm Password" field  
   Then the form should accept the input  

#### Scenario: Enter mismatched password and confirm password
   Given the admin has enabled "Create Login Credentials"  
   When the admin enters a password and a different value in the "Confirm Password" field  
   Then an error message should display saying "Password and Confirm Password do not match."  

#### Scenario: Enter an invalid password
   Given the admin has enabled "Create Login Credentials"  
   When the admin enters a password that does not meet security requirements  
   Then an error message should display saying "Password must include uppercase, lowercase, numbers, and symbols."  

#### Scenario: Leave password fields blank
   Given the admin has enabled "Create Login Credentials"  
   When the admin leaves the "Password" or "Confirm Password" field blank  
   Then an error message should display saying "Password and Confirm Password are required."  

---

### Feature: Define Account Status

#### Scenario: Default account status is enabled
   Given the admin is on the "Add Employee" form  
   Then the account status should default to "Enabled"  

#### Scenario: Toggle account status
   Given the admin is on the "Add Employee" form  
   When the admin toggles the account status  
   Then the account status should switch between "Enabled" and "Disabled"  

---

### Feature: Save Employee Details

#### Scenario: Save employee details with valid input
   Given the admin has filled out all required fields correctly  
   When the admin clicks the "Save" button  
   Then the employee's details should be saved in the system  
   And the form should reset for adding another employee  

#### Scenario: Save button is disabled with invalid input
   Given the admin is on the "Add Employee" form  
   When any required field is missing or invalid  
   Then the "Save" button should be disabled  

---

### Feature: Cancel Operation

#### Scenario: Cancel adding an employee
   Given the admin is on the "Add Employee" form  
   When the admin clicks the "Cancel" button  
   Then all entered information should be cleared  
   And the admin should be navigated to the previous screen or dashboard  

---

### Feature: Display Validation Errors

#### Scenario: Display validation errors for missing mandatory fields
   Given the admin is on the "Add Employee" form  
   When the admin tries to submit the form with missing mandatory fields  
   Then an error message should display for each missing field  

#### Scenario: Display validation errors for invalid input
   Given the admin is on the "Add Employee" form  
   When the admin tries to submit the form with invalid input (e.g., invalid password)  
   Then an error message should display specifying the issue (e.g., "Password must include uppercase, lowercase, numbers, and symbols.")  