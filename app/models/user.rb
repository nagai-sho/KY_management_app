class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :sites, through: :user_sites
  has_many :user_sites
  has_many :ky_sheets

  with_options presence: true do
    validates :company
    validates :name
    validates :name_kana
    validates :phone_number
  end

  validates :phone_number, uniqueness: true,
            format: { with: /\A\d{2,4}[-]\d{3,4}[-]\d{4}\z/,
            message: 'は10桁または11桁の数字で, - を用いて入力してください' }
  validates :name_kana, format: { with: /\A[ァ-ヶー　\s]+\z/, message: 'はカタカナで入力してください' }

  before_validation :normalize_phone_number

  private
  def normalize_phone_number
    if phone_number.present?
      normalized = phone_number.gsub(/\s-/, '')
      case normalized.length
      when 10
        self.phone_number = normalized.gsub(/\A(\d{2})(\d{4})(\d{4})\z/, '\1-\2-\3')
      when 11
        self.phone_number = normalized.gsub(/\A(\d{3})(\d{4})(\d{4})\z/, '\1-\2-\3')
      else
        self.phone_number = normalized
      end
    end
  end

end
