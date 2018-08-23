require "spec_helper"

RSpec.describe Email, type: :model do
  context  "Column specifications" do
   it {is_expected.to have_db_column(:email).of_type(:string)}
   it {is_expected.to have_db_column(:status).of_type(:boolean)}
   it {is_expected.to have_db_column(:user_id).of_type(:integer)}
   it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
   it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
 end

  let(:user) { User.new(name: "test_name", password: "test_password") }

  subject {
    described_class.new(email: "test@gmail.com", user: user)
  }

  context  "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context  "Associations" do
    it {is_expected.to belong_to(:user)}
  end
end
