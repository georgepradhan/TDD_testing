require 'spec_helper'

describe "Menu Items Controller" do
  let!(:menu_item) { FactoryGirl.create :menu_item }

  context "show menu item" do
    it "displays the name, description, price, and the menu name it belongs to" do
      get "menus/#{menu_item.menu.id}/menu_items/#{menu_item.id}"
      expect(last_response.body).to include(menu_item.name, menu_item.description, menu_item.price.to_s, menu_item.menu.name)
    end
  end

  context "create menu item" do
    it "creates a menu with valid attributes" do
    expect {
        post "/menus/menu_items", params={ name: menu_item.name, description: menu_item.description, price: menu_item.price.to_s, menu_id: menu_item.menu.id}
          }.to change(MenuItem, :count).by(1)

    end
    # it "doesn't create a menu with invalid attributes"
    # it "shows errors saving the menu Items"
  end

end
