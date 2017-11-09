json.extract! hoot, :id, :message, :user_id, :created_at, :updated_at
json.url hoot_url(hoot, format: :json)
