# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  user_id    :integer
#  movie_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id }
end
