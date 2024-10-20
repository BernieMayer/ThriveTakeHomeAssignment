require './src/Company'
require './src/User'
require './src/Verification'
require 'json'

class Challenge

  def process
    file_path_for_users = "src/users.json"
    file_path_for_companies = "src/companies.json"

    user_file = File.read(file_path_for_users)
    companies_file = File.read(file_path_for_companies)

    users_hash = JSON.parse(user_file)
    companies_hash = JSON.parse(companies_file)

    companies = []
    companies_hash.each do |company_hash|
      if Verification.verify_company(company_hash)
        companies.append(Company.new(company_hash))
      else
        puts "An invalid user json was detected, the json was #{company_hash}"
      end
    end

    users = []
    users_hash.each do |user_hash|
      if Verification.verify_user(user_hash)
        user = User.new(user_hash)
        users.append(user)
      else
        puts "An invalid user json was detected, the json was #{user_hash}"
      end
    end 
    
    output = "\n"
    companies.each do |company|
      company.add_users(users)
      output << company.output_top_ups_data << "\n"
    end
    
    puts output

    File.write("output.txt", output)
  end

end

Challenge.new.process