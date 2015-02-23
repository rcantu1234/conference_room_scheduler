json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :user_id, :room_id, :start_time, :end_time
  json.url meeting_url(meeting, format: :json)
end
