Feature: Upload Employee Profile Picture

   Scenario: Upload a valid profile picture
      Given the admin is on the "Add Employee" form
      When the admin uploads a profile picture in ".jpg" format under 1MB
      Then the profile picture should be successfully uploaded

   Scenario: Upload an invalid file format
      Given the admin is on the "Add Employee" form
      When the admin uploads a file in ".pdf" format
      Then an error message should be displayed stating "Invalid file format. Please upload a .jpg, .png, or .gif file"

   Scenario: Upload a file exceeding the size limit
      Given the admin is on the "Add Employee" form
      When the admin uploads a ".png" file larger than 1MB
      Then an error message should be displayed stating "File size exceeds the 1MB limit"

   Scenario: Upload a profile picture with incorrect dimensions
      Given the admin is on the "Add Employee" form
      When the admin uploads a ".gif" file with dimensions other than 200px X 200px
      Then a warning message should be displayed recommending "Recommended dimensions are 200px X 200px"