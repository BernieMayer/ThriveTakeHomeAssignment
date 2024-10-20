class Company
  attr_accessor :id, :name, :top_up, :email_status

  def initialize(company_hash)
    @id = company_hash["id"].to_i
    @name = company_hash["name"]
    @top_up = company_hash["top_up"].to_i
    @email_status = company_hash["email_status"]
  end

end