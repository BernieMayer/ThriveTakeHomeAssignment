class Challenge
  require 'json'

  def process
    file_path_for_users = "users.json"
    file_path_for_companies = "companies.json"

    user_file = File.read(file_path_for_users)
    companies_file = File.read(file_path_for_companies)

    user_hash = JSON.parse(user_file)

    puts(user_hash[0])

  end

end

Challenge.new.process