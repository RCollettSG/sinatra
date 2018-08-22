require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
# Create first route

get "/" do
  "Hi, World!"
end
