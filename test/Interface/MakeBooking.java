/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

//package com.example.tests;
import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class MakeBooking {

    private WebDriver driver;
    private String baseUrl;
    private boolean acceptNextAlert = true;
    private StringBuffer verificationErrors = new StringBuffer();

    @Before
    public void setUp() throws Exception {
        driver = new FirefoxDriver();
        baseUrl = "http://localhost:8080/";
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    }

    @Test
    public void testMakeBooking() throws Exception {
        driver.get(baseUrl + "/HMS-ICARE/index.jsp");
        driver.findElement(By.linkText("ONLINE BOOKING")).click();
        driver.findElement(By.id("dname")).clear();
        driver.findElement(By.id("dname")).sendKeys("era");
        driver.findElement(By.xpath("//input[@value='SEARCH']")).click();
        driver.findElement(By.xpath("(//a[contains(text(),'Channel')])[3]")).click();
        driver.findElement(By.linkText("Book")).click();
        driver.findElement(By.id("pname")).clear();
        driver.findElement(By.id("pname")).sendKeys("Chandu");
        driver.findElement(By.id("telephone")).clear();
        driver.findElement(By.id("telephone")).sendKeys("0717189255");
        driver.findElement(By.id("nic")).clear();
        driver.findElement(By.id("nic")).sendKeys("931250353V");
        driver.findElement(By.id("email")).clear();
        driver.findElement(By.id("email")).sendKeys("cbherath93@gmail.com");
        driver.findElement(By.xpath("//button[@type='submit']")).click();
    }

    @After
    public void tearDown() throws Exception {
        driver.quit();
        String verificationErrorString = verificationErrors.toString();
        if (!"".equals(verificationErrorString)) {
            fail(verificationErrorString);
        }
    }

    private boolean isElementPresent(By by) {
        try {
            driver.findElement(by);
            return true;
        } catch (NoSuchElementException e) {
            return false;
        }
    }

    private boolean isAlertPresent() {
        try {
            driver.switchTo().alert();
            return true;
        } catch (NoAlertPresentException e) {
            return false;
        }
    }

    private String closeAlertAndGetItsText() {
        try {
            Alert alert = driver.switchTo().alert();
            String alertText = alert.getText();
            if (acceptNextAlert) {
                alert.accept();
            } else {
                alert.dismiss();
            }
            return alertText;
        } finally {
            acceptNextAlert = true;
        }
    }
}
