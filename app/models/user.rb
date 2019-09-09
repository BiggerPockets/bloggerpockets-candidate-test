# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts
  # has_many :comments isn't necessary here, as I'm never making a user.comments call
  # but I find it helps the readability of the project
  has_many :comments
end
