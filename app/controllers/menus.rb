get '/' do
  @menus = Menu.all
  erb :index
end

post '/menus' do
  @menu = Menu.new params
  if @menu.save
    redirect '/'
  else
    @menus = Menu.all
    @errors = @menu.errors.full_messages
    erb :index
  end
end

get '/menus/:id' do
  @menu = Menu.find params[:id]
  erb :show
end

get '/menus/:menu_id/menu_items/:menu_item_id' do 
  @menu = Menu.find params[:menu_id]
  @menu_item = MenuItem.find params[:menu_item_id]
  erb :show_menu_item
end

post '/menus/menu_items' do
  # menu_id = params[:menu_id]
  puts params
  @menu_item = MenuItem.new(params)
  if @menu_item.save
    redirect '/'
  else
    @menu = @menu_item.menu
    @errors = @menu_item.errors.full_messages
    erb :show_menu_item
  end
end

