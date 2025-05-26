package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class AddEmployeePage {

    WebDriver driver;

    // Locators
    private By addEmployeeForm = By.id("add-employee-form");
    private By uploadInput = By.id("profile-picture-upload");
    private By successMessage = By.id("upload-success-message");
    private By errorMessage = By.id("upload-error-message");
    private By warningMessage = By.id("upload-warning-message");

    public AddEmployeePage(WebDriver driver) {
        this.driver = driver;
    }

    public boolean isAddEmployeeFormDisplayed() {
        return driver.findElement(addEmployeeForm).isDisplayed();
    }

    public void uploadFile(String filePath) {
        driver.findElement(uploadInput).sendKeys(filePath);
    }

    public boolean isUploadSuccessMessageDisplayed() {
        return driver.findElement(successMessage).isDisplayed();
    }

    public String getErrorMessage() {
        return driver.findElement(errorMessage).getText();
    }

    public String getWarningMessage() {
        return driver.findElement(warningMessage).getText();
    }
}