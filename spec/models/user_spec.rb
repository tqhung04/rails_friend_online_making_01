require "spec_helper"

RSpec.describe User, type: :model do
  context  "Column specifications" do
   it {is_expected.to have_db_column(:name).of_type(:string)}
   it {is_expected.to have_db_column(:avatar).of_type(:string)}
   it {is_expected.to have_db_column(:nick_name).of_type(:string)}
   it {is_expected.to have_db_column(:genre).of_type(:integer)}
   it {is_expected.to have_db_column(:description).of_type(:text)}
   it {is_expected.to have_db_column(:hobby).of_type(:text)}
   it {is_expected.to have_db_column(:country).of_type(:string)}
   it {is_expected.to have_db_column(:status).of_type(:integer)}
   it {is_expected.to have_db_column(:matching).of_type(:boolean)}
   it {is_expected.to have_db_column(:is_blocked).of_type(:boolean)}
   it {is_expected.to have_db_column(:admin).of_type(:boolean)}
   it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
   it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
  end

  subject {
    described_class.new(name: "test_admin", password: "test_password")
  }

  context  "Validations" do
    it "is valid with valid attributes" do
      is_expected.to validate_length_of(:name).is_at_most(Settings.maximum.length_name)
      is_expected.to validate_length_of(:password).is_at_least(Settings.minimum.length_password)
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  context  "Associations" do
    it {is_expected.to have_one(:email)}
    it {is_expected.to have_one(:desire)}
    it {is_expected.to have_one(:birthday)}
    it {is_expected.to have_one(:body)}
    it {is_expected.to have_one(:education)}
    it {is_expected.to have_one(:career)}
    it {is_expected.to have_one(:local)}
    it {is_expected.to have_many(:blogs)}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:photos)}
    it {is_expected.to have_many(:blocks)}
    it {is_expected.to have_many(:reports)}
    it {is_expected.to have_many(:conversations)}
    it {is_expected.to have_many(:messages)}
    it {is_expected.to have_many(:complaints)}
  end
end
