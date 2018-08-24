class Post
  attr_accessor(:id, :title, :post_body)

  # Open a connection
  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  # Will save to the database
  def save

    conn = Post.open_connection

    if (!self.id)
      # If it hasn't got an ID, create it
      sql = "INSERT INTO post (title, post_body) VALUES ('#{self.title}', '#{self.post_body}');"
    else
      # If it has an ID then update it by the id
      sql = "UPDATE post SET title='#{self.title}', post_body='#{self.post_body}' WHERE id = #{self.id}"
    end

    conn.exec(sql)
  end

  # Get all the results
  def self.all
    # Create a connection
    conn = self.open_connection
    # Assign the SQL
    sql = "SELECT id, title, post_body FROM post ORDER BY id;"
    # Execute the SQL
    results = conn.exec(sql)
    # Assign each result in an array
    posts = results.map do |result|
      self.hydrate(result)
    end
    # Return posts
    posts
  end

  # Get what we want by ID
  def self.find(id)
    conn = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1;"

    posts_result = conn.exec(sql)

    post = self.hydrate(posts_result[0])
  end

  # Delete an entry by its ID
  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM post WHERE id = #{id}"
    conn.exec(sql)
  end

  # Make sure the data is in the right format before going into the database
  def self.hydrate(post_data)
    # Instantiate the object
    post = Post.new
    # Assign the data we want
    post.id = post_data["id"]
    post.title = post_data["title"]
    post.post_body = post_data["post_body"]
    post
  end
end
