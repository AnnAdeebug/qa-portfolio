# API-BUG-001 — PATCH Update Not Persisted

## Summary

Patch request returns 200 OK and shows the updated data.However, when check again by using GET, the data was not changed. 

## API

**API:** JSONPlaceholder
**Method:** PATCH
**Endpoint:** `/users/1`

## Preconditions

User with ID 1 exists

## Steps to Reproduce

1. Send a PATCH request to `/users/1`
2. Update the user's name
3. Check the PATCH response
4. Send GET request to `/users/1`
5. Compare the result.

## Expected Result

The updated value should be shown instead when using GET

## Actual Result

The PATCH request returned `200 OK` and the response showed the updated name.

When GET `/users/1` was sent afterwards, the user's original name was returned instead of the updated name.

## Result

**FAIL**

## Evidence

### PATCH Response

* Status: `200 OK`
* Response showed the updated name.

### Follow-up GET Response

* Status: `200 OK`
* Response returned the original name.




