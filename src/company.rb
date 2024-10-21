class Company
  attr_accessor :id, :name, :top_up, :email_status

  def initialize(company_hash)
    @id = company_hash["id"].to_i
    @name = company_hash["name"]
    @top_up = company_hash["top_up"].to_i
    @email_status = company_hash["email_status"]
    @users = Set.new
  end

  def output_top_ups_data
    output = ""

    if @users.length == 0
      return output
    end
    users_emailed_hashes = []
    users_not_emailed_hashes = []
    total_top_ups = 0

    @users.sort_by(&:last_name).each do |user|

     
      total_top_ups += @top_up
      obj = {
        previous_token_balance: user.tokens,
        new_token_balance: user.tokens + @top_up,
        user: user
      }
      should_email_user = user.email_status && @email_status
      should_email_user ? users_emailed_hashes.append(obj) : users_not_emailed_hashes.append(obj)
    end

    output << "\tCompany Id: #{@id}\n"
    output << "\tCompany Name: #{@name}\n"

    output << "\tUsers Emailed:\n"
    append_token_balance_to_output(users_emailed_hashes, output)

    output << "\tUsers Not Emailed:\n"
    append_token_balance_to_output(users_not_emailed_hashes, output)

    output << "\t\tTotal amount of top ups for #{@name}: #{total_top_ups}\n"

    return output
  end

  def append_token_balance_to_output(users_token_hashes, output)
    users_token_hashes.each do |user_hash|
      user = user_hash[:user]
      output << "\t\t#{user.last_name}, #{user.first_name}, #{user.email}\n"
      output << "\t\t  Previous Token Balance, #{user_hash[:previous_token_balance]}\n"
      output << "\t\t  New Token Balance #{user_hash[:new_token_balance]}\n"
    end
  end

  def add_users(users_array)
    users_array.each do |user|
      @users.add(user) if user.company_id == @id && user.active_status
    end
  end
end