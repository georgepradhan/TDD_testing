class Menu < ActiveRecord::Base
  validates :name, :start_at, :presence => true
  before_save :titilize_title

  has_many :menu_items
  
  private
  def titilize_title
    self.name.gsub! '-', ' '
  end
end
