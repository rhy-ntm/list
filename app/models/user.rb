class User < ActiveRecord::Base
  has_many :task
end
