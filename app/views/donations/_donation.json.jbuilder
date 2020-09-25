json.extract! donation, :id, :name, :address, :amount, :received_by, :purpose, :payment_type, :payment_method, :check_no, :check_expiry_date, :transaction_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
