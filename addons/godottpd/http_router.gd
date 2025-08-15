## A base class for all HTTP routers
##
## This router handles all the requests that the client sends to the server.
## [br]NOTE: This class is meant to be expanded upon instead of used directly.
## [br]Usage:
## [codeblock]
## class_name MyCustomRouter
## extends HttpRouter
##
## func handle_get(request: HttpRequest, response: HttpResponse) -> void:
##     response.send(200, "Hello World")
## [/codeblock]
class_name HttpRouter
extends RefCounted

var path := ''

# for regex path matching
var rpath : RegEx

var params: Array[String]

var handle_get: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "GET not allowed")
	return false
	
var handle_post: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "POST not allowed")
	return false

var handle_head: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "POST not allowed")
	return false
	
var handle_put: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "POST not allowed")
	return false

var handle_patch: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "POST not allowed")
	return false

var handle_delete: Callable = func(request: HttpRequest, response: HttpResponse) ->  bool:
	#response.send(405, "POST not allowed")
	return false

var handle_options: Callable = func(request: HttpRequest, response: HttpResponse) -> bool:
	#response.send(405, "POST not allowed")
	return false

var condition: Callable = func(request: HttpRequest) -> bool:
	return true

func _init(
	path: String,
	options: Dictionary = {
		'get': handle_get,
		'post': handle_post,
		'head': handle_head,
		'put': handle_put,
		'patch': handle_patch,
		'delete': handle_delete,
		'options': handle_options,
		'condition': condition,
	}
	) -> void:
		self.path = path
		self.handle_get = options.get('get', self.handle_get)
		self.handle_post = options.get('post', self.handle_post)
		self.handle_head = options.get('head', self.handle_head)
		self.handle_put = options.get('put', self.handle_put)
		self.handle_patch = options.get('patch', self.handle_patch)
		self.handle_delete = options.get('delete', self.handle_delete)
		self.handle_options = options.get('options', self.handle_options)
		self.condition = options.get('condition', self.condition)
		


### Handle a GET request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_get(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "GET not allowed")
#
#
### Handle a POST request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_post(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "POST not allowed")
#
#
### Handle a HEAD request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_head(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "HEAD not allowed")
#
#
### Handle a PUT request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_put(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "PUT not allowed")
#
#
### Handle a PATCH request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_patch(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "PATCH not allowed")
#
#
### Handle a DELETE request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_delete(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "DELETE not allowed")
#
#
### Handle an OPTIONS request
### [br]
### [br][param request] - The request from the client
### [br][param response] - The node to send the response back to the client
#@warning_ignore("unused_parameter")
#func handle_options(request: HttpRequest, response: HttpResponse) -> void:
	#response.send(405, "OPTIONS not allowed")
