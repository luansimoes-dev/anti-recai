This document explains all the surroundings about how the API should work.

1. Requests/Responses
The requests on the API will be able to be distinguished between(by now) 2 levels. PRIVATE and PUBLIC.

1.1. Name convention.
The name convention of every request and response will follow the pattern of camelCase. Each field on a JSON object MUST be named following camelCase style.

1.2 Public Requests
Every Public API, MUST be able to be executed with no problems related to authentication. So, one that wants to simply use a Public api, should be able to do
so with no more difficulties.

1.3. Private Requests
Every Private API, MUST use the Authentication System(see 2). If the Request is not authenticated to be executed, then the server should return an NOAUTH error(see 3).

1.4. Restricted Requests
Restricted Requests are requests that should be accessed only by restricted users, so users with some specific permissions. The way to define so will be on the routes. The given example explains the nomenclature for it:

request POST(Permission.READ && Permission.Write) "/path" (data:T) -> Out;
where it will require both permissions to READ and WRITE. On no permission, it returns MISSINGPERM(MissingPermission).

1.5. Time on Requests/Responses
Time on requests/response bodies SHOULD ALWAYS follow the default defined on rfc 3339 utilizing explicit timestamp.
On the requests/response heraders they SHOULD ALWAYS follow the default defined on rfc 7231.
If some timestamp is given and doesn't follow this, it should respond with INVALIDREQ.

2. Authentication System
To make sure a request is authenticated, thus, able to execute some PRIVATE api, is used JWT tokens for so. The provided JWT should contain metadata such as, the user id, email, and permissions.
The following figure gives an example of it:
{
  "userId": "someUUID",
  "email": "some@email.com",
  "role": "roleName",
}.
The JWT token MUST be passed following OAuth2 rules(RFC6750). See https://datatracker.ietf.org/doc/html/rfc6750 for more information, which is, on Authorization header prefixed by "Bearer ", such as:
Authorization: Bearer <token>

3. Errors
Errors do follow OAuth2 pattern but with more content since it's being idealized to a Server <-> Client communication. Thus, the status codes will follow OAuth2 pattern, but the body MUST include informations about the error.
The default body of an error should contain information such the name of the error and the description, and time it happened. Informations about the error and how to solve it, if that's a Public API, or the requester has got Permission.Solution permission.
The following exemplifies so:
{
  "name": "NOAUTH",
  "description": "You are not authenticated to do this. Invalid token",
  "solution": "Try logging in if doesn't have an account, or if so, contacting an Adm to retrieve more privileges"
  "requestedAt": "2026-05-03T14:30:00Z"
}

3.1 NOAUTH.
This happens when some API requires a token but did not provide, or did provide some invalid. This error should occur only on the Authentication system, and any other problem related to the request SHOULD NOT
be handled by using this error.
When this happens, error 401 is returned 

3.2 INVALID_REQ.
The error will happen when the content sent by the client does not match the expected by the server. Thus, this returns error 400 is returned.
The following gives an example of INVALID_REQ:

{
  "name": "INVALID_REQ",
  "description": "Missing field 'id' on request body",
  "solution": "Provide an 'id', with value being a numeric > 0",
  "requestedAt": "2026-05-03T14:30:00Z"
}

3.3. MISSING_PERMISSION(permission).
This will happen when some API is sent, is authenticated, but the one trying to execute it, has no permissions to finalize it. This error should occur only on the Permission system.
Returning 403 on erroring.
{
  "name": "MISSING_PERMISSION:WRITE",
  "description": "You haven't permission to WRITE",
  "solution": "Request permission to some admin",
  "requestedAt": "2026-05-03T14:30:00Z"
}
