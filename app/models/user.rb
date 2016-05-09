class User < ActiveRecord::Base
  has_many :contacts
  has_many :favourites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def handle
   self.email.split('@')[0]
  end
end