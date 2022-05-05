class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'should be double-byte character' } do
    validates :firstname
    validates :lastname
  end  

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'should be double-byte kana' } do
    validates :firstname_read
    validates :lastname_read
  end  

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must include both alphabetic and numeric characters, without double-byte characters'

  has_many :items
end
