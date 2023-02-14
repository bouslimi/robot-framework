*** Variables ***
# Can be overridden: robot -v browser:firefox
${browser}              chrome    # default browser

${base_url}             http://localhost:8080
${signup_endpoint}      /api/persons/signup

# Test User (don't modify! - Create onother user to test update or deletion)
${user_email}           amine@trigger-soft.com
${user_password}        qwerty@123
${user_first_name}      Nelson
${user_last_name}       Amigos
