class Company
  
  def initialize(company_hash)
    @id = company_hash[:id]
    @name = company_hash[:name]
    @top_up = company_hash[:top_up]
    @email_status = company_hash[:email_status]
  end

end