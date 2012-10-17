class Trophy < ActiveRecord::Base

  attr_accessible :name, :text, :value

  belongs_to :user

end
