# GodotTPD

A routeable HTTP server for Godot.

This addon for the [Godot engine](https://godotengine.com) includes classes to start an HTTP server which can handle requests to paths using a set of routers in the way [ExpressJS](https://expressjs.com/) works.

## Example

```gdscript
	# simple get request
	# you can do other options like 'post' and 'delete' and so on
	var simpleroute := HttpRouter.new('/', {
		'get': func(request: HttpRequest, response: HttpResponse):
			response.send(200, 'hello world')
			return true
	})

	# handles routes with parameters
	var paramroute := HttpRouter.new('/:test', {
		'get': func(request: HttpRequest, response: HttpResponse):
			response.send(200, 'hello world %s' % request.parameters['test'])
			return true
	})

	# static file server example
	var fileroute := HttpFileRouter.new('/', '/home/something/static')

	# conditional route
	# only return response from this route if they are an admin or whatever other custom logic you want
	var conditionalroute := HttpRouter.new('/', {
		'get': func(request: HttpRequest, response: HttpResponse):
			response.send(200, 'hello world')
			return true,
		'condition': func(request: HttpRequest):
			return isAdmin(request)
	})

	var server = HttpServer.new()

	server.register_router(simpleroute)
	server.register_router(paramroute)
	# ... and so on

	add_child(server)

	server.start()
```

Each method handler should return true if they are capturing the request. Return false if aren't and it would allow another router to capture the request.

## Current main issues
Static file delivery loads the whole file, then delivers to the client. This has obvious RAM implications leading to DDOS issues.
TLS/SSL is not handled by the server currently. Using services like CloudFlare's tunnel services can supply the TLS/SSL protection, but this isn't ideal.

