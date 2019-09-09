# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  # belongs_to :post isn't necessary here, as I'm never making a comments.post call
  # but I find it helps the readability of the project
  belongs_to :post

  scope :published, -> { where(published: true) }
end
