# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  before_save { email.downcase! }

  # аргумент presence: true — это хэш опций с одним элементом
  # фигурные скобки необязательны, если хэш передаётся последним аргументом в метод
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 225 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Возвращает дайджест данной строки
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
