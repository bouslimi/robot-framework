import sys
import requests
import json
from robot.api.deco import keyword


@keyword("UserSignupViaApi")
def user_signup_via_api(request_url, first_name, last_name, email, password):
    request_headers = {'Content-Type': 'application/json'}
    request_body = {
        "firstName": first_name,
        "lastName": last_name,
        "email": email,
        "password": password
    }
    request_body_str = json.dumps(request_body)
    response = requests.post(
        request_url, data=request_body_str, headers=request_headers)
    response_status_code = response.status_code

    print(f"Response Status Code : {response_status_code}")

    return response_status_code


if __name__ == '__main__':
    globals()[sys.argv[1]](sys.argv[2], sys.argv[3],
                           sys.argv[4], sys.argv[5], sys.argv[6])

# Command line:
# $ python3 apiutils.py user_signup_via_api "http://localhost:8080/api/persons/signup" "Amine" "Ben" "amine@trigger-soft.com" "qwerty@123"
