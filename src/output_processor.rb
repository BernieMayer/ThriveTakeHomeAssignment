class OutputProcessor
  
  def self.process_user_company(company, users)
    output = ""
    users_emailed_hashes = []
    users_not_emailed_hashes = []
    total_top_ups = 0
    users.sort_by(&:last_name).each do |user|
      next if user.company_id != company.id
     
      total_top_ups += company.top_up
      obj = {
        previous_token_balance: user.tokens,
        new_token_balance: user.tokens + company.top_up,
        user: user
      }
      should_email_user = user.email_status && company.email_status
      should_email_user ? users_emailed_hashes.append(obj) : users_not_emailed_hashes.append(obj)
    end

    output << "\tCompany Id: #{company.id}\n"
    output << "\tCompany Name: #{company.name}\n"

    output << "\tUsers Emailed:\n"
    append_token_balance_to_output(users_emailed_hashes, output)

    output << "\tUsers Not Emailed:\n"
    append_token_balance_to_output(users_not_emailed_hashes, output)

    output << "\t\tTotal amount of top ups for #{company.name}: #{total_top_ups}\n"

    return output
  end

  def self.append_token_balance_to_output(users_token_hashes, output)
    users_token_hashes.each do |user_hash|
      user = user_hash[:user]
      output << "\t\t#{user.last_name}, #{user.first_name}, #{user.email}\n"
      output << "\t\t  Previous Token Balance, #{user_hash[:previous_token_balance]}\n"
      output << "\t\t  New Token Balance #{user_hash[:new_token_balance]}\n"
    end
  end
end