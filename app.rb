require "sinatra"
require "sinatra/contrib"

# Reloads the server every time the dev environment is saved
require "sinatra/reloader" if development?

# Create first route
get "/" do
  "Welcome to my website"
end

# READ ROUTE
get "/cars" do
  "Get all cars"
end

# CREATE ROUTE
get "/cars/new" do
  "Get new form"
end

post "/cars/new" do
  "This was added"
end

# UPDATED ROUTE
get "/cars/edit" do
  "Get edit form"
end

put "/cars/edit" do
  "This was updated"
end

# DELETE ROUTE
delete "/cars/:id" do
  "This was deleted"
end

# Will get any ID you put in the path after / unless it meets one of the conditions above
get "/cars/:id" do
  id = params[:id]
  "Display one car #{id}"
end
