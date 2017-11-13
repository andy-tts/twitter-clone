class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :encryptable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hoots

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :username, uniqueness: true
end
