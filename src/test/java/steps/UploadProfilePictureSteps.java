package steps;

import io.cucumber.java.en.*;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import pages.AddEmployeePage;
import utils.DriverFactory;

public class UploadProfilePictureSteps {

    WebDriver driver = DriverFactory.getDriver();
    AddEmployeePage addEmployeePage = new AddEmployeePage(driver);

    @Given("the admin is on the {string} form")
    public void theAdminIsOnTheForm(String formName) {
        driver.get("https://example.com/add-employee"); // Replace with actual URL
        Assert.assertTrue(addEmployeePage.isAddEmployeeFormDisplayed());
    }

    @When("the admin uploads a profile picture in {string} format under 1MB")
    public void theAdminUploadsAProfilePictureInFormatUnder1MB(String fileType) {
        addEmployeePage.uploadFile("src/test/resources/test-files/valid-profile-picture.jpg");
    }

    @Then("the profile picture should be successfully uploaded")
    public void theProfilePictureShouldBeSuccessfullyUploaded() {
        Assert.assertTrue(addEmployeePage.isUploadSuccessMessageDisplayed());
    }

    @When("the admin uploads a file in {string} format")
    public void theAdminUploadsAFileInFormat(String fileType) {
        addEmployeePage.uploadFile("src/test/resources/test-files/invalid-file.pdf");
    }

    @Then("an error message should be displayed stating {string}")
    public void anErrorMessageShouldBeDisplayedStating(String errorMessage) {
        Assert.assertEquals(errorMessage, addEmployeePage.getErrorMessage());
    }

    @When("the admin uploads a {string} file larger than 1MB")
    public void theAdminUploadsAFileLargerThan1MB(String fileType) {
        addEmployeePage.uploadFile("src/test/resources/test-files/large-file.png");
    }

    @When("the admin uploads a {string} file with dimensions other than 200px X 200px")
    public void theAdminUploadsAFileWithIncorrectDimensions(String fileType) {
        addEmployeePage.uploadFile("src/test/resources/test-files/incorrect-dimensions.gif");
    }

    @Then("a warning message should be displayed recommending {string}")
    public void aWarningMessageShouldBeDisplayedRecommending(String warningMessage) {
        Assert.assertEquals(warningMessage, addEmployeePage.getWarningMessage());
    }
}