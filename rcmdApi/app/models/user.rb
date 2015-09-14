class User < ActiveRecord::Base
  serialize :items
  serialize :similarity
end
