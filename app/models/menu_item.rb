class MenuItem < ActiveRecord::Base
  belongs_to :menu
  validates_presence_of :name, :description, :price, :menu

end
