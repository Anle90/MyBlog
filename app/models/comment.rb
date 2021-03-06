class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true, length: {minimum: 2, maximum: 250}
end
