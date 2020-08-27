class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_day, presence: true

  PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :first_name, :last_name, :first_name_kana, :last_name_kana, with: PASSWORD_REGEX, message: 'Full-width katakana characters'

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end