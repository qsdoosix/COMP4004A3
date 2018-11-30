package SeleniumTest;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class BrowserTest {
	public static void main(String args[]) {
		WebDriver driver = new ChromeDriver();
		System.setProperty("webdriver.chrome.driver", "D:\\MyDocuments\\201809\\4004\\Assignment3\\COMP4004A3\\chromedriver.exe");
		driver.get("http://www.seleniumhq.org");
	}
}
