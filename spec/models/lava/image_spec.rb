require "spec_helper"

describe Lava::Image do
  describe "methods" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:upload_content_type).of_type(:string) }
    it { should have_db_column(:upload_file_size).of_type(:string) }
    it { should have_db_column(:upload_uid).of_type(:string) }
    it { should have_db_column(:upload_name).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:caption).of_type(:string) }
    it { should have_db_column(:url).of_type(:string) }
  end
  describe "associations" do
  end
  describe "validations" do
  end
  describe "methods" do
  end
end