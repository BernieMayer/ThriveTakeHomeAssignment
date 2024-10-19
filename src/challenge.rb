require './src/Company'
require './src/User'
require 'json'

class Challenge

  def process
    file_path_for_users = "src/users.json"
    file_path_for_companies = "src/companies.json"

    user_file = File.read(file_path_for_users)
    companies_file = File.read(file_path_for_companies)

    users_hash = JSON.parse(user_file)
    companies_hash = JSON.parse(companies_file)

    puts(users_hash[0])

  
    companies = []
    companies_hash.each do |company_hash|
      companies.append(Company.new(company_hash))
    end

    users = []
    users_hash.each do |user_hash|
      users.append(User.new(user_hash))
    end  
  end

end

Challenge.new.process