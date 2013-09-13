require 'spec_helper'
describe "Menus Controller", :type => :controller do
  let!(:menu) { FactoryGirl.create :menu }
  context "index" do
    it "displays a list of menus by name" do
      get '/'
      expect(last_response.body).to include(menu.name)
    end
    it "doesn't show the menu descriptions" do
      get '/'
      expect(last_response.body).to_not include(menu.description)
    end
  end

  context "create menu" do
    it "creates a menu with valid attributes" do
      expect {
        post '/menus', params={ name: menu.name, description: menu.description, 
      start_at: Time.now, end_at: Time.now + 1}
      }.to change(Menu, :count).by(1)

      # menu_count = Menu.count
      # post '/menus', params={ name: "new_menu.name", description: menu.description, 
      # start_at: Time.now, end_at: Time.now + 1}
      # expect(Menu.count).to eq(menu_count + 1)

    end
    it "doesn't create a menu with invalid attributes" do
      menu_count = Menu.count
      post '/menus', params={}
      expect(Menu.count).to eq(menu_count)
    end
    it "shows errors" do
      post '/menus', params={}
      expect(last_response.body).to include("Name can't be blank", 
        "Start at can't be blank")
    end
  end

  context "show menu" do
    it "displays the menu name" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include(menu.name)
    end
    it "displays the menu description" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include(menu.description)
    end
    it "displays the menu start and end dates" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include("#{menu.start_at}", "#{menu.end_at}")
    end
    it "displays a list of all menu items" do
      get "/menus/#{menu.id}"
      items = menu.menu_items.map { |item| item.name }
      items.length.times do |i|
        expect(last_response.body).to include(items[i])
      end
    end
  end
end


# ! vs no !????



