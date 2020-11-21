# To Run
```
./setup.sh
./start.sh
```

# To Test

Use Curl to check the headers:

When a X-Request-Id header is sent, it will be seen by the application
and rendered in the view. It will also be returned in the response headers.
```
curl -i -H "X-Request-Id: Sent-Request-ID" localhost:9001
```

When we don't send the "X-Request-Id" one is generated.
```
curl -i  localhost:9001
```

# Notes
The way that this works is:
The MyApp::Middelayer::RequestTracer will try to find the X-Request-Id header in
the env hash that the Web Server Produced.

If it does not find a value it will generate one.

Thid value is sent in the env hash under an INTERNAL_REQUEST_ID header so that
the application can find it and use it.

The X-Request-Id is also set in the response headers after the @app.call so that the caller
or any other redirects can use it.

# How Rails Does it:
Middelayer::RequestTracer uses a similar way to set the X-Request-ID has Rails does in the middleware:
ActionDispatch:RequestID

Sets the Internal X-Request-ID here that is then used in controllers etc.
"action_dispatch.request_id"
https://github.com/rails/rails/blob/fe76a95b0d252a2d7c25e69498b720c96b243ea2/actionpack/lib/action_dispatch/middleware/request_id.rb#L26
https://github.com/rails/rails/blob/371b4800266cbf1c659a9068f58412cb7a88e244/actionpack/lib/action_dispatch/http/request.rb#L314

Notice how it checks if the header exists by calling:
request.x_request_id
This method is generated here:
https://github.com/rails/rails/blob/371b4800266cbf1c659a9068f58412cb7a88e244/actionpack/lib/action_dispatch/http/request.rb#L53
Used here:
https://github.com/rails/rails/blob/371b4800266cbf1c659a9068f58412cb7a88e244/actionpack/lib/action_dispatch/http/response.rb#L193
https://github.com/rails/rails/blob/371b4800266cbf1c659a9068f58412cb7a88e244/actionpack/lib/action_dispatch/http/request.rb#L213
To then just use the method get_header from the request
https://github.com/rails/rails/blob/371b4800266cbf1c659a9068f58412cb7a88e244/actionpack/lib/action_dispatch/http/request.rb#L213

Sets the response X-Request-Id here:
https://github.com/rails/rails/blob/fe76a95b0d252a2d7c25e69498b720c96b243ea2/actionpack/lib/action_dispatch/middleware/request_id.rb#L27

