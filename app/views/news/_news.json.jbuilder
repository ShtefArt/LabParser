json.extract! news, :id, :time, :name, :publisher, :created_at, :updated_at
json.url news_url(news, format: :json)
