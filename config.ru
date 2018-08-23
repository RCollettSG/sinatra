require "sinatra"
require "sinatra/contrib"
# Reloads the server every time the dev environment is saved
require "sinatra/reloader" if development?
require_relative "./controllers/posts_controller.rb"

# Direct the request to the correct controller
run PostsController
