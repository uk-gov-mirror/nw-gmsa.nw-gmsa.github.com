
## Referenced Standards

- [EURIDICE EU Health Data API - Authorization](https://hl7.eu/fhir/health-data-api/en/authorization.html)]
- [IHE Internet User Authorization (IUA)](https://profiles.ihe.net/ITI/IUA/index.html)

### Get Authorization Server Metadata [ITI-103]

#### Request

<div class="alert alert-success" role="alert">
GET {{oauth2}}/.well-known/openid-configuration
</div>

#### Response

```json
{
  "issuer": "https://127.0.0.1/healthconnect/oauth2",
  "authorization_endpoint": "https://127.0.0.1/healthconnect/oauth2/authorize",
  "token_endpoint": "https://127.0.0.1/healthconnect/oauth2/token",
  "userinfo_endpoint": "https://127.0.0.1/healthconnect/oauth2/userinfo",
  "revocation_endpoint": "https://127.0.0.1/healthconnect/oauth2/revocation",
  "introspection_endpoint": "https://127.0.0.1/healthconnect/oauth2/introspection",
  "jwks_uri": "https://127.0.0.1/healthconnect/oauth2/jwks",
  "registration_endpoint": "https://127.0.0.1/healthconnect/oauth2/register",
  "end_session_endpoint": "https://127.0.0.1/healthconnect/oauth2/logout",
  "scopes_supported": [
    "openid",
    "profile",
    "email",
    "address",
    "phone",
    "system/*.*"
  ],
  "response_modes_supported": [
    "query",
    "fragment",
    "form_post"
  ],
  "code_challenge_methods_supported": [
    "plain",
    "S256"
  ],
  "grant_types_supported": [
    "client_credentials",
    "jwt_authorization",
    "refresh_token"
  ]
}
```

### Get Access Token [ITI-71] (client credentials)

#### Request

Body is the following values in x-www-form-urlencoded format

| Key | Value              |
|-----|--------------------|
| grant_type | `client_credentials` |
| scope | `system/*.*` | 

<div class="alert alert-success" role="alert">
GET {{oauth2}}/token<br/>
Authorization: Basic {base64 clientid and clientsecret}<br/>
Content-Type: application/x-www-form-urlencoded
</div>

#### Response

```json
{
    "access_token": "REMOVED",
    "token_type": "bearer",
    "expires_in": 3600,
    "scope": "system/*.*"
}
```

### Introspect Token [ITI-102]

#### Request

Body is the following values in x-www-form-urlencoded format

| Key   | Value             |
|-------|-------------------|
| token | {token} to verify |

<div class="alert alert-success" role="alert">
POST {{oauth2}}/introspection<br/>
Authorization: Basic {base64 clientid and clientsecret}<br/>
Content-Type: application/x-www-form-urlencoded
</div>

#### Response

```json
{
    "active": false
}
```
