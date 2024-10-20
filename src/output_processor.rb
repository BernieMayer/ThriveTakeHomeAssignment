class OutputProcessor
  
  def self.process_user_company(company, users)
    output = ""
    users_emailed_hashes = []
    users_not_emailed_hashes = []
    total_top_ups = 0
    users.sort_by(&:last_name).each do |user|
      if user.email_status && company.email_status
        obj = {
          previous_token_balance: user.tokens,
          new_token_balance: user.tokens + company.top_up,
          user: user
        }
        total_top_ups += company.top_up
        users_emailed_hashes.append(obj)
      else 
        obj = {
          previous_token_balance: user.tokens,
          new_token_balance: user.tokens + company.top_up,
          user: user
        }
        total_top_ups += company.top_up
        users_not_emailed_hashes.append(obj)
      end
    end

    output << "\tCompany Id: #{company.id}\n"
    output << "\tCompany Name: #{company.name}\n"

    output << "\tUsers Emailed:\n"
    users_emailed_hashes.each do |user_hash|
      user = user_hash[:user]
      output << "\t\t#{user.last_name}, #{user.first_name}, #{user.email}\n"
      output << "\t\t  Previous Token Balance, #{user_hash[:previous_token_balance]}\n"
      output << "\t\t  New Token Balance #{user_hash[:new_token_balance]}\n"
    end

    output << "\tUsers Not Emailed:\n"
    users_not_emailed_hashes.each do |user_hash|
      user = user_hash[:user]
      output << "\t\t#{user.last_name}, #{user.first_name}, #{user.email}\n"
      output << "\t\t  Previous Token Balance, #{user_hash[:previous_token_balance]}\n"
      output << "\t\t  New Token Balance #{user_hash[:new_token_balance]}\n"
    end

    output << "\t\tTotal amount of top ups for #{company.name}: #{total_top_ups}\n"

    return output
  end
end