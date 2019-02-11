class Affirmation < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content, :likes
end
