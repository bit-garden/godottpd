> [!IMPORTANT]
> I am taking over as new maintainer as of 7/7/2025. Please see https://github.com/deep-entertainment/issues/issues/56 for details.

# GodotTPD

A routeable HTTP server for Godot.

This addon for the [Godot engine](https://godotengine.com) includes classes to start an HTTP server which can handle requests to paths using a set of routers in the way [ExpressJS](https://expressjs.com/) works.

## Basic workflow

Create a router class that extends [HttpRouter](HttpRouter.md). Overwrite the methods that handle the required HTTP methods required for the specific path:

```gdscript
extends HttpRouter
class_name MyExampleRouter


func handle_get(request, response):
	response.send(200, "Hello!")

```

This router would respond to a GET [request](HttpRequest.md) on its path and send back a [response](HttpResponse.md) with a 200 status code and the body "Hello!".

Afterwards, create a new [HttpServer](HttpServer.md), add the router and start the server. This needs to be called from a node in the SceneTree.

```gdscript
var server = HttpServer.new()
server.register_router("/", MyExampleRouter.new())
add_child(server)
server.start()
```

## Documentation

Further information can be found in the API documentation:

- [HttpRequest](docs/api/HttpRequest.md)
- [HttpResponse](docs/api/HttpResponse.md)
- [HttpRouter](docs/api/HttpRouter.md)
- [HttpServer](docs/api/HttpServer.md)
- [HttpFileRouter](docs/api/HttpFileRouter.md)

