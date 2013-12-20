json.array!(@bills) do |bill|
  json.extract! bill, :id, :date, :description, :value, :responsible_id
  json.url bill_url(bill, format: :json)
end
