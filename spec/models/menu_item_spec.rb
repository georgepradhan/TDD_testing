require 'spec_helper'
describe MenuItem do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :menu }
  end

  context "associations" do
    it { should belong_to :menu }
  end

  context "#name" do
    let(:test_menu_item) { FactoryGirl.create :menu_item }
    it "returns the menu item's name" do 
      test_menu_item.name 
    end
  end
end

