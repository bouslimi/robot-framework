# Robot Framework

Test Automation project using Robot Framework and Selenium (Python).


## Basics

- Robot Framework is a generic test automation framework used for acceptance testing.
- Based on keyword-driven testing approach.
- Recommanded for ATTD (Acceptance Test Driven Development).
- Robot Framework can use Libraries like Selenium, DateTime,... (Libraries are written with Python or Java).

## 1. Setup Robot Framework

### 1.1 Install VSCode
- Add required Extensions to VSCode :  
**Python**  
**Pylance**  
**Robot Framework Language Server**


### 1.2 Install Python3
```
sudo apt update
sudo apt install python3
python --version
```
### 1.3 Install Pip
Pip: Package Installer for Python.
```
sudo apt update
sudo apt install python3-pip
pip --version
```
- Useful Pip commands
```
pip install packagename   # Install new package
pip install packagename==4.4.2   # Install specified package version
pip install --upgrade packagename   # Upgrade an installed package

pip show packagename   # Get installed package info

pip uninstall packagename   # Uninstall package

pip list   # List all installed packages

pip check   # Check for broken requirements
```

### 1.4 Install required packages
```
pip install selenium
pip install robotframework
pip install robotframework-seleniumlibrary
```

### 1.5 Other useful packages
```
pip install webdrivermanager
```


## 2. Write Test Cases

### 2.1 Test Case Example
```
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Add variables here

*** Test Cases ***
Login Test
#   Create Webdriver    Chrome    executable_path=/mytests/robot-framework/drivers/chromedriver
#   Go To    https://www.google.com
    Open Browser    https://www.google.com    chrome    executable_path=/home/mohamed/Desktop/mytests/robot/robot-framework-selenium/drivers/chromedriver_linux64/chromedriver_v104
    Input Text    xpath://input[@title='Search']    jendouba
    Press Keys    xpath://input[@title='Search']    RETURN  
    Close Browser

*** Keywords ***
# Add keywords here

```


# 3. Execute Test Cases via Command line

## 3.1 Sequential execution via robot

Suppose we have Test Cases tagged **[tags] regression** and others tagged **[tags] performance**.  
* -i means --include
* -e means --exclude

### 3.1.1 Execute all Test Suites
```
robot testsuites/
# or
robot testsuites/*.robot
```

### 3.1.2 Execute one Test Suite
```
robot testsuites/test_suite_1.robot
```

### 3.1.3 Execute some Test Cases
```
# Execute only regression TC
robot -i regression testsuites/

# Execute only regression and performance TC
robot -i regression -i performance testsuites/
```

### 3.1.4 Exclude some Test Cases
```
# Exclude regression TC
robot -e regression testsuites/

# Exclude regression and performance TC
robot -e regression -e performance testsuites/
```

### 3.1.5 Include and Exclude Test Cases
```
# Execute regression and Exclude performance TC
robot -i regression -e performance testsuites/
```

### 3.1.6 Execute tests on different browsers
```
# Execute tests on firefox browser
robot -v browser:firefox testsuites/

# Execute regression tests on chrome browser
robot -v browser:chrome -i regression testsuites/
```

### 3.1.7 Execute tests on headless browser
```
# Execute tests on headless firefox browser
robot -v browser:headlessfirefox testsuites/

# Execute tests on headless chrome browser
robot -v browser:headlesschrome testsuites/
```

## 3.2 Parallel execution via pabot

Pabot is a parallel executor for Robot Framework test cases.

- **Parallel execution is not recommanded when using shared test data for CRUD tasks.**

### 3.2.1 Required package
```
pip install robotframework-pabot

# For documentation and more infos
pabot --help
```

### 3.2.2 Run tests parallelly
```
pabot --processes 2 testsuites/
```


# 4. Data Driven Testing

## 4.1 DDT using script
```
*** Settings ***
Suite Setup         OpenBrowserMaximized
Suite Teardown      Close Browser
Test Template       FailedLogin


*** Test Cases ***            email              password
Valid email Wrong password    test@email.com     wrong123
Wrong email Valid password    xyz@email.com      azerty@123
Wrong email Wrong password    xyz@email.com      wrong123


*** Keywords ***
FailedLogin
    [Arguments]    ${email}    ${password}
    LoginToWebapp    ${email}    ${password}
    Alert Should Be Present    Wrong login and/or password!    ACCEPT
```

## 4.2 DDT using CSV and Excel Files

https://pypi.org/project/robotframework-datadriver/
```
pip install robotframework-datadriver
```


# 5. Connect to PostgreSQL using Python

## 5.1 Required packages

- These packages are needed to connect to PostgreSQL database
```
sudo apt install python-dev
sudo apt install libpq-dev
pip install psycopg2    # https://wiki.postgresql.org/wiki/Using_psycopg2_with_PostgreSQL
```
