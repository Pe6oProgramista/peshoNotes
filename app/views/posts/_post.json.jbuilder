json.extract! post, :id, :body, :created_at, :updated_at, :count
json.url post_url(post, format: :json)
