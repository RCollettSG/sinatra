class PostsController < Sinatra::Base
  get "/" do
    "<h1>Homepage</h1>"
  end

  get "/new" do
    "New"
  end

  get "/:id" do
    "Get one #{params[:id]}"
  end

  post "/" do
    "Create a new item"
  end

  put "/:id" do
    "Update #{params[:id]}"
  end

  delete "/:id" do
    "Delete #{params[:id]}"
  end

  get "/:id/edit" do
    "Gets the edit form with data of the selected item"
  end
end
