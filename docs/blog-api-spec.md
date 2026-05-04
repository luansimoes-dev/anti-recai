This document specifies the behavior of the API.

0. Notes for the Spec.

0.1. Terms
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [RFC2119] [RFC8174] when, and only when, they appear in all capitals, as shown here.

0.2. Route Syntax
The route syntax is defined by
`
request METHOD(<path>) -> Return{
  requiredSystems: [(Systems)]
  body: (BodyType),
  urlParams: {
    p1: (Type),
    p2: (Type)
  }
}`
The following exemplifies one route example:
`
request GET("/") -> Out {
  requiredSystems: [Authentication, Permission(READ)],
  body: SomeType,
  urlParams: {
    p1: int
  }
}`
The `requiredSystems` is a validation pipeline that MUST validate the received request, sequentially, stopping on the first error.
Thus, the given example must check on Authentication System, then Permission System, requiring the permission of 'READ', and then, it'd execute properly.
The usage of 'None' on any params of the request model means that the request MUST NOT receive anything from them, otherwise the request MUST return an INVALID_REQ.

1. Requests/Responses
The requests on the API will be able to be distinguished between(by now) 2 levels. PRIVATE and PUBLIC.

1.1. Name convention.
The name convention of every request and response will follow the pattern of camelCase. Each field on a JSON object MUST be named following camelCase style.

1.2 Public Requests
Every Public API, MUST be able to be executed with no problems related to authentication. So, one that wants to simply use a Public api, should be able to do
so with no more difficulties.

1.3. Private Requests
Every Private API, MUST use the Authentication System(see 2). If the Request is not authenticated to be executed, then the server should return a NOAUTH error(see 3).

1.4. Restricted Requests
Restricted Requests are requests that SHOULD be accessed only by restricted users, so users with some specific permissions. The way to define so will be on the routes. The given example explains the nomenclature for it:

request POST("/path") -> Out {
  requiredSystems: [Authentication, Permission(Read, Write)],
  body: None,
  urlParams: None
};
where it will require both permissions to Read and Write. On no permission, it returns MISSING_PERMISSION(MissingPermission).

1.5. Time on Requests/Responses
Time on requests/response bodies SHOULD follow the default defined on RFC 3339 using explicit timestamp.
On the requests/response headers they SHOULD follow the default defined on RFC 7231.
If some timestamp is given and doesn't follow this, it should respond with INVALID_REQ.

2. Authentication System
To make sure a request is authenticated, thus, able to execute some PRIVATE api, is used JWT tokens for so. The provided JWT SHOULD contain metadata such as, the user id, email, and the role.
The following figure gives an example of it:
{
  "userId": "someUUID",
  "email": "some@email.com",
  "role": "roleName",
}.
The JWT token MUST be passed following OAuth2 rules(RFC 6750). See https://datatracker.ietf.org/doc/html/rfc6750 for more information, which is, on Authorization header prefixed by "Bearer ", such as:
Authorization: Bearer <token>

3. Errors
Errors MUST follow HTTP status code semantics but Authentication related ones, SHOULD align with OAuth2(RFC 6750). The body of the Authentication errors are idealized to contain more content, such as information about the errors, since it's being used in a Server <-> Client communication.
The default body of an error SHOULD contain information such the name of the error and the description, and time it happened. Informations about the error and how to solve it, if that's a Public API, or the requester has the required `Permission.Solution` permission.
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
This will happen when some API is sent, is authenticated, but the requester has no permissions to finalize it. This error should occur only on the Permission system. Returns 403 on erroring.
The missing permission error MUST suffixed by the permission that was missing in uppercase, being separated by a ':', such as the following:
{
  "name": "MISSING_PERMISSION:WRITE",
  "description": "You do not have permission to WRITE",
  "solution": "Request permission to some admin",
  "requestedAt": "2026-05-03T14:30:00Z"
}

4. Permissions.
The permission system will contain a set of permissions, and attribute a role that contains some of them. For examples, permissions for read, write, and delete, we assign a role that contains that 3 ones, and give the role to the user.
When the user requests something, the permission system will check if the role of the requester contains the necessary permissions to execute properly, otherwise, returns MISSING_PERMISSION.
The following exemplifies how a request would be treated, supposing the following request:

`request POST("/posts/create") -> void {
  requiredSystems: [Authentication, Permission(Read, Write)],
  body: BlogPost,
  urlParams: None
}`

4.1. Write.
Permission to write anything on the database, cache, etc. This makes it able to Overwrite/Create things for its own. Thus, an user with Write permission could create a 'POST' but no POST for others.

4.2. Read.
Permission to read on the database. This mainly for NON-ADM things.

4.3 Delete.
Permission to delete things on the database. Related only to the creator of the content itself.

4.4. ReadAll.
Permission to read everything. This is mainly for admin, which may contain stuff that no other people should have access.

4.5. DeleteAll.
Permission to delete everything. This is mainly for admin, which may be able to delete another's post due to not following some rule
