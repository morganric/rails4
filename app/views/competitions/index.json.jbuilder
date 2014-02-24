json.array!(@competitions) do |competition|
  json.extract! competition, :id, :title, :body, :css
  json.url competition_url(competition, format: :json)
end
