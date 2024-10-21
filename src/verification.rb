class Verification

  def self.verify_user(user_hash)
    attributes = ["id", "first_name", "last_name", "email", 
    "company_id", "active_status","tokens"]

    attributes.all? { |attribute| user_hash.key?(attribute.to_s) }
  end

  def self.verify_company(company_hash)
    
  end
  
end