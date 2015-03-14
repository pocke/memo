class Board < ActiveRecord::Base
  has_many :memos
  belongs_to :user

  validates_presence_of :user
end
