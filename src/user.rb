class User

  def initialize(user_hash)
    @id = user_hash[:id]
    @first_name = user_hash[:first_name]
    @last_name = user_hash[:last_name]
    @email = user_hash[:email]
    @comapny_id = user_hash[:company_id]
    @email_status = user_hash[:active_status]
    @tokens = user_hash[:tokens]
  end

end