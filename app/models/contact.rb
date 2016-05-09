class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :favourites

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :phone, allow_blank: false, length: { in: 10..11 }
  validates :email, allow_blank: false, length: { in: 5..50 }

  validates_format_of :phone, allow_blank: false, :with => /\A[+ 0-9 -]+$\z/
  validates_format_of :email, allow_blank: false, :with => /@/, message: 'must contain @.'
end
