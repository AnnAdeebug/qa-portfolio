# API Testing

API testing practice using Postman and the JSONPlaceholder REST API.

## Overview

This project contains manual and automated API testing practice covering common REST API operations.

## Tools

* Postman
* JSONPlaceholder API
* Git & GitHub

## Testing Covered

* GET requests
* POST requests
* PUT requests
* PATCH requests
* DELETE requests
* Query parameters
* Positive and negative testing
* Response data checking
* HTTP status code validation
* Automated tests in Postman

## Test Cases

The project includes 18 API test cases covering:

* Retrieving users
* Searching users by username and email
* Creating users
* Updating users
* Deleting users
* Testing non-existing users
* Testing missing and empty fields
* Verifying data after an update

Detailed test cases are available in [`test-cases/API-TestCases.md`](test-cases/API-TestCases.md).

## Postman Collection

The Postman collection contains the API requests and automated test scripts used during testing.

Collection: [`postman/QA-Shop-Testing.postman_collection.json`](postman/QA-Shop-Testing.postman_collection.json)

## Testing Finding

One of the tests showed an interesting result.

I used PATCH to change the user's name. The API returned `200 OK` and showed the updated name.

However, when I used GET to check the same user again, the name was back to the original name.

This showed me that getting a `200 OK` does not always mean the requested data was actually updated as expected. It is important to check the response data and verify the result after an update.