posts = Blogr::Post.order(published_at: :desc).where(published: true)
json.posts posts, :id, :title, :content, :permalink, :published_at, :created_at, :updated_at, :category_id, :user_id