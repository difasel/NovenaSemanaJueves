class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  validates :tweet,  uniqueness: true
end
