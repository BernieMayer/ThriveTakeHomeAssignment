require './src/Verification'

describe Verification do

  describe "#self.verify_user" do

    describe "invalid hash" do
      let! (:invalid_user_hash) { 
        {
      "id" => 30,
      "email" => "genesis.carr@demo.com",
      "company_id" => 1,
      "email_status" => true,
      "active_status" => true,
      "tokens" => 71
    }
  }

      it "should return true" do
          expect(Verification.verify_user(invalid_user_hash)).to be(false)
      end

    end

    describe "valid hash" do
      let! (:user_hash) { 
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

      it "should return true" do
          expect(Verification.verify_user(user_hash)).to be(true)
      end
    end
  end
  
  describe "#self.verify_company" do
    describe "invalid hash" do
      let! ( :invalid_company_hash) { 	{
        "id" => 1,
        "top_up" => 71,
        "email_status" => false
      }
    }

      it "should return true" do
        expect(Verification.verify_company(invalid_company_hash)).to be(false)
      end
    end

    describe "valid hash" do
      let! ( :company_hash) { 	{
        "id" => 1,
        "name" => "Blue Cat Inc.",
        "top_up" => 71,
        "email_status" => false
      }
    }

      it "should return true" do
        expect(Verification.verify_company(company_hash)).to be(true)
      end
    end
  end
end