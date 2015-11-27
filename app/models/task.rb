class Task < ActiveRecord::Base
  belongs_to :users
  belongs_to :categories
end
