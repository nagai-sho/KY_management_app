class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :sites, through: :users_sites
  has_many :users_sites
  has_many :ky_sheets

  with_options presence: true do
    validates :company
    validates :name
    validates :name_kana
    validates :phone_number
    validates :position
  end

  validates :phone_number, uniqueness: true,
            format: { with: /\A\d{2,4}[-]\d{3,4}[-]\d{4}\z/,
            message: 'は10桁または11桁の数字で, - を用いて入力してください' }
  validates :name_kana, format: { with: /\A[ァ-ヶー\s]+\z/, message: 'はカタカナで入力してください' }

end
