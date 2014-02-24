json.array!(@designs) do |design|
  json.extract! design, :id, :image, :slug, :title, :description
  json.url design_url(design, format: :json)
end
