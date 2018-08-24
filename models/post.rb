class Post
  attr_accessor(:id, :title, :post_body)

  # Open a connection
  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  # Will save to the database
  def save

  end

  # Get all the results
  def self.all

  end

  # Get what we want by ID
  def self.find(id)

  end

  # Delete an entry by its ID
  def self.destroy(id)

  end

  # Make sure the data is in the right format before going into the database
  def self.hydrate(post_data)

  end
end
