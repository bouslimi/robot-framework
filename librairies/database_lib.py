import psycopg2
import sys
from robot.api.deco import keyword


@keyword("GetUserToken")
def get_user_token(email):
    # Define our connection string
    conn_string = "host='localhost' dbname='testdb' user='postgres' password='password'"
    # get a connection, if a connect cannot be made an exception will be raised here
    conn = psycopg2.connect(conn_string)
    # conn.cursor will return a cursor object, you can use this cursor to perform queries
    cursor = conn.cursor()
    # execute our Query
    cursor.execute(f"SELECT token FROM person WHERE email='{email}';")
    # retrieve the token from the database
    user_token = cursor.fetchone()[0]

    # print(user_token)

    return user_token


if __name__ == '__main__':
    globals()[sys.argv[1]](sys.argv[2])

# Command line:
# $ python3 dbutils.py get_user_token "amine@trigger-soft.com"
