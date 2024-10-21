require './src/Company'
require './src/User'

describe Company do

  describe "process_user_company" do
    let! (:user_1) { 
      {
		"id" => 30,
		"first_name" => "Genesis",
		"last_name" => "Carr",
		"email" => "genesis.carr@demo.com",
		"company_id" => 1,
		"email_status" => true,
		"active_status" => true,
		"tokens" => 71
	}
}
let(:user_2) {
    {
    "id" => 19,
    "first_name" => "Eileen",
    "last_name" => "Lynch",
    "email" => "eileen.lynch@fake.com",
    "company_id" => 1,
    "email_status" => true,
    "active_status" => true,
    "tokens" => 40
  }
}

  let! ( :company_hash) { 	{
    "id" => 1,
    "name" => "Blue Cat Inc.",
    "top_up" => 71,
    "email_status" => false
  }
}

let!(:company) { Company.new(company_hash)}
let!(:users) { [ User.new(user_1), User.new(user_2)]}
  
  it "should output the correct output" do
    company.add_users(users)
    output = <<-TEXT
	Company Id: 1
	Company Name: Blue Cat Inc.
	Users Emailed:
	Users Not Emailed:
		Carr, Genesis, genesis.carr@demo.com
		  Previous Token Balance, 71
		  New Token Balance 142
		Lynch, Eileen, eileen.lynch@fake.com
		  Previous Token Balance, 40
		  New Token Balance 111
		Total amount of top ups for Blue Cat Inc.: 142
        TEXT

    expect(company.output_top_ups_data).to eq(output)
  end

  describe "company with no users" do
    let! ( :company_hash) { 	{
      "id" => 1,
      "name" => "Blue Cat Inc.",
      "top_up" => 71,
      "email_status" => false
    }
  }

  let!(:company) { Company.new(company_hash)}
    it "should return empty string" do
      expect(company.output_top_ups_data).to eq("")
    end

  end

end

end