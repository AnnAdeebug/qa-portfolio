# API Test Cases

## Overview

API testing practice using Postman and JSONPlaceholder API.

## Test Environment

- Tool: Postman
- API: JSONPlaceholder
- Testing Type: REST API Testing
- Methods Tested: GET, POST, PUT, PATCH, DELETE

## Test Cases

### Test Case 1: Get all users

- **Method:** GET
- **Endpoint:** https://jsonplaceholder.typicode.com/users
- **Expected:** Status code: 200
	            Response should contain user data (Total of 10 data)
- **Actual	:** 200 OK, 124 ms, all data is shown
- **Result	:** PASS

### Test Case 2: Get existing users

Method	: GET
Endpoint: https://jsonplaceholder.typicode.com/users/1
Expected: Status code: 200
	      Response should contain user ID 1
Actual	: 200 OK, 115 ms, user ID 1 is shown
Result	: PASS

### Test Case 3: Get non-existing users

Method	: GET
Endpoint: https://jsonplaceholder.typicode.com/users/999
Expected: Status code: 404
Actual	: 404 Not Found, 749 ms, {}
Result	: PASS

### Test Case 4: Get user with invalid ID

Method   : GET
Endpoint : https://jsonplaceholder.typicode.com/users/abc

Expected : Status code: 404
	       Response should indicate that the requested user doesn't exist
Actual   : 404 Not Found, 56 ms, {}
Result   : PASS

### Test Case 5: Search user by username

Method   : GET
Endpoint : https://jsonplaceholder.typicode.com/users?username=Bret

Expected : Status code: 200
           Response should contain 1 user
           Username should be "Bret"
           User's name should be "Leanne Graham"

Actual   : 200 OK, 111 ms
           1 user returned
           Username: Bret
           Name: Leanne Graham

Result   : PASS

### Test Case 6: Create a new user

Method   : POST
Endpoint : https://jsonplaceholder.typicode.com/users
Request Body:
{
    "name": "Ahn",
    "username": "ahngel",
    "email": "ahn@gmail.com"
}

Expected : Status code: 201
           Response should contain the submitted user data
           Response should generate an ID for the new user

Actual   : 201 Created, 1.01 s
	Response contains:
	Name: Ahn
	Username: ahngel
	Email: ahn@gmail.com
	ID: 11

Result   : PASS

### Test Case 7: Create user without email (negative testing) 

Method   : POST
Endpoint : https://jsonplaceholder.typicode.com/users
Request Body:
{
    "name": "Ahn",
    "username": "ahngel"
}
Expected : API should reject missing required email

Actual   : 201 Created, 761ms
	   User created without email

	Response contains:
	Name: Ahn
	Username: ahngel
	ID: 11

Result   : NEEDS VERIFICATION

### Test Case 8: Create user with empty username (negative testing)

Method   : POST
Endpoint : https://jsonplaceholder.typicode.com/users
Request Body:
{
    "name": "Ahn",
    "username": "",
    "email": "ahn@gmail.com"
}

Expected : Should reject invalid/empty username (if username is required)

Actual   : 201 Created, 650ms
	   User created with empty username

	Response contains:
	Name: Ahn
	Username: 
	Email: ahn@gmail.com
	ID: 11

Result   : NEEDS VERIFICATION

### Test Case 9: Create user with empty name (negative testing)

Method   : POST
Endpoint : https://jsonplaceholder.typicode.com/users
Request Body:
{
    "name": "",
    "username": "ahngel",
    "email": "ahn@gmail.com"
}

Expected : Should reject invalid/empty name (if name is required)

Actual   : 201 Created, 1.19s
User created with empty name

	Response contains:
	Name: 
	Username:ahngel
	Email: ahn@gmail.com
	ID: 11

Result   : NEEDS VERIFICATION

### Test Case 10: Delete existing user

Method   : DELETE
Endpoint : https://jsonplaceholder.typicode.com/users/1

Expected : Should successfully delete the existing user and return a successful status code

Actual   : 200 OK, 892ms
User deletion request was successful

Response contains: {}

Result   : PASS

### Test Case 11: Delete non-existing user(negative testing)

Method   : DELETE
Endpoint : https://jsonplaceholder.typicode.com/users/999

Expected : Should reject the request or return an appropriate error status code because the user does not exist

Actual   : 200 OK, 736ms
Delete request was accepted even though user ID 999 does not exist

Response contains: {}

Result   : NEEDS VERIFICATION

### Test Case 12: Update existing user

Method   : PUT
Endpoint : https://jsonplaceholder.typicode.com/users/1
Request Body:
{
"name": "Ahn67",
"username": "ahn67",
"email": "ahn67@gmail.com"
}

Expected : Should successfully update the name, username, and email and return the updated user information

Actual   : 200 OK, 802ms
User information was successfully updated

Response contains:
Name: Ahn67 
Username: ahn67 
Email: ahn67@gmail.com 
ID: 1

Result   : PASS

### Test Case 13: Update non-existing user (negative testing)

Method   : PUT
Endpoint : https://jsonplaceholder.typicode.com/users/999
Request Body:
{
"name": "Nobody",
"username": "nobody999",
"email": "nobody@gmail.com"
}

Expected : Should reject the request and return an appropriate error status code because the user does not exist

Actual   : 500 Internal Server Error, 736ms
Update request failed because user ID 999 does not exist

Response contains:
TypeError: Cannot read properties of undefined (reading 'id')

Result   : NEEDS VERIFICATION

### Test Case 14: Update specific user field using PATCH

Method   : PATCH
Endpoint : https://jsonplaceholder.typicode.com/users/1
Request Body:
{
"name": "Ahn Keonho"
}

Expected : Should successfully update only the name while keeping the other user information unchanged

Actual   : 200 OK, 1.07s
Name was successfully updated while other information remained unchanged

Response contains:
ID: 1 
Name: Ahn Keonho 
Username: Bret 
Email: Sincere@april.biz

Result   : PASS

### Test Case 15: Update specific user field of non-existing user (negative testing)

Method   : PATCH
Endpoint : https://jsonplaceholder.typicode.com/users/999
Request Body:
{
"name": "Nobody"
}

Expected : Should reject the request and return an appropriate error status code because the user does not exist

Actual   : 200 OK, 769ms
API accepted the PATCH request for non-existing user ID 999

Response contains:
Name: Nobody

Result   : NEEDS VERIFICATION

### Test Case 16: Verify user information after PATCH update

Method   : GET
Endpoint : https://jsonplaceholder.typicode.com/users/1

Expected : User ID 1 should contain the updated name "Ahn Keonho" after the previous PATCH request

Actual   : 200 OK, 1.4s
User ID 1 still contains the original name "Leanne Graham"

Response contains:
ID: 1
Name: Leanne Graham
Username: Bret
Email: Sincere@april.biz

Result   : FAIL

### Test Case 17: Search user by email using query parameter

Method   : GET
Endpoint : https://jsonplaceholder.typicode.com/users?email=Sincere@april.biz

Expected : Should return the user matching the specified email address

Actual   : 200 OK, 1.55s
API returned one user matching the specified email address

Response contains:
ID: 1
Name: Leanne Graham
Username: Bret
Email: Sincere@april.biz

Result   : PASS

### Test Case 18: Search user by non-existing email (negative testing)

Method   : GET
Endpoint : https://jsonplaceholder.typicode.com/users?email=doesnotexist@gmail.com

Expected : Should return an empty result because no user has the specified email address

Actual   : 200 OK, 756ms
API returned  empty result

Response contains:
[]

Result   : PASS

