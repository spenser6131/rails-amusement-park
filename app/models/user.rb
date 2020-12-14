class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password
  validates :name, presence: true

  def mood
    if !admin
      if happiness > nausea
        "happy"
      else
        "sad"
      end
    end
  end
end
