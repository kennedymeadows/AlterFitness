json.extract! video, :id, :name, :filename, :created_at, :updated_at
json.url video_url(video, format: :json)
