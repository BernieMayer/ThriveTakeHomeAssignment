class User
  attr_accessor :first_name,:last_name, :email, :active_status, :email_status, :company_id, :tokens

  def initialize(user_hash)
    @id = user_hash["id"]
    @first_name = user_hash["first_name"]
    @last_name = user_hash["last_name"]
    @email = user_hash["email"]
    @company_id = user_hash["company_id"].to_i
    @email_status = user_hash["email_status"]
    @active_status = user_hash["active_status"]
    @tokens = user_hash["tokens"].to_i
  end

end