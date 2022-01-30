json.extract! question, :id, :content, :is_faq, :is_private, :created_at, :updated_at
json.url question_url(question, format: :json)
