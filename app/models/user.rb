class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 12
end
