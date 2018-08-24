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
    post_body: "This is the first post"
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
    post_body: "This is the fourth post"
  }]

  get "/" do
    @title = "Blog posts"
    @posts = Post.all
    # Get the template and layout for the index page
    erb :"posts/index"
  end

  get "/new" do
    @title = "Add an item"
    @post = Post.new
    erb :"posts/new"
  end

  get "/:id" do
    # Get the ID from the params
    id = params[:id].to_i
    # Assign the ID to a variable
    @post = Post.find(id)
    erb :"posts/show"
  end

  post "/" do
    # Make a new object with the form information
    post = Post.new

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save
    # Redirect to /
    redirect "/"
  end

  put "/:id" do
    # Get the id
    id = params[:id].to_i
    # Find the post
    post = Post.find(id)
    # Reassign the post
    post.title = params[:title]
    post.post_body = params[:post_body]
    # Update the post
    post.save
    # Redirect when this is all done
    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    Post.destroy(id)
    redirect "/"
  end

  get "/:id/edit" do
    @title = "Edit an item"
    id = params[:id].to_i
    @post = Post.find(id)
    erb :"posts/edit"
  end
end
