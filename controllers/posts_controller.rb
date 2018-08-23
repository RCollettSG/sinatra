class PostsController < Sinatra::Base
  # Sets the root ad the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # Sets the views directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Starts the reloader
  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    id: 0,
    title: "Post 0",
    post_body: "This is the 0 post"
  },
  {
    id: 1,
    title: "Post 1",
    post_body: "This is the second post"
  },
  {
    id: 2,
    title: "Post 2",
    post_body: "This is the third post"
  },
  {
    id: 3,
    title: "Post 3",
    post_body: "This is the third post"
  }]

  get "/" do
    @title = "Blog posts"
    @posts = $posts
    erb :"posts/index"
  end

  get "/new" do
    erb :"posts/new"
  end

  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]
    erb :"posts/show"
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
    erb :"posts/edit"
  end
end
