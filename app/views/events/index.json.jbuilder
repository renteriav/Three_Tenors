json.array!(@events) do |event|
  json.extract! event, :id, :title, :location, :address, :city, :zip, :date, :time, :ticket_link, :location_website
  json.url event_url(event, format: :json)
end
