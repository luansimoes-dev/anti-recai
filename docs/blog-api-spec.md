This document explains all the surroundings about how the API should work.

1. Requests
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
where it will require both permissions to READ and WRITE. On no permission, it returns NotEnoughtPermission(MissingPermission).

2. Authentication System
To make sure a request is authenticated, thus, able to execute some PRIVATE api, is used JWT tokens for so. The provided JWT should contain metadata such as, the user id, email, and permissions.
The following figure gives an example of it:
{
  "userId": "someUUID",
  "email": "some@email.com",
  "role": "admin",
  ... jwt doesnt need to be shown
}

