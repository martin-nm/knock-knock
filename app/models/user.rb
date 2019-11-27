class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job, presence: true
  validates :email, presence: true
  # validates :bio, presence: true
  has_many :posts
  has_many :messages

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  # has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
end
