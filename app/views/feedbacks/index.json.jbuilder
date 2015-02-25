json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :message, :user_id, :meeting_id
  json.url feedback_url(feedback, format: :json)
end
