import sys
from robot.api.deco import keyword
from webdrivermanager.chrome import ChromeDriverManager
from webdrivermanager.gecko import GeckoDriverManager
from logging import error


@keyword("GetDriverPath")
def get_driver_path(browser_name):
    if browser_name in ["chrome", "headlesschrome"]:
        driver_path = ChromeDriverManager().download_and_install()
    elif browser_name in ["firefox", "headlessfirefox"]:
        driver_path = GeckoDriverManager().download_and_install()
    else:
        error(f"UNKNOWN BROWSER NAME: {browser_name}")
    # print(driver_path)
    return driver_path


if __name__ == '__main__':
    globals()[sys.argv[1]](sys.argv[2])

# Command line:
# $ python3 drivermanager.py get_driver_path chrome
