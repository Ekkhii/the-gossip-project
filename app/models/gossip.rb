class Gossip < ApplicationRecord
	validates :anonymous_author, presence: true
	validates :content, presence: true
	has_many :comments, dependent: :destroy
end
