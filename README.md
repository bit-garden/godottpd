# GodotTPD

A routeable HTTP server for Godot.

This allows composable http servers to be built and configured. The idea is wherever Godot or it's editor can be ran, a server can be hosted. This would allow headless devices as well as normal desktops, androids and ios(ipads and iphones) to be able to host a server. Building it this way also allows UI to be easily tacked on as Godot has this baked in.

This project was inherited from dploeger. It was originally marketed as an ExpressJS like framework, but since my changes, I'm not sure this is true anymore.

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

TLS/SSL is not handled by the server currently. 
