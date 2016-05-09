class Favourite < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
end
