class Article < ApplicationRecord

	#all articles belong to one user
	belongs_to :user
	#all articles have present in one or more tuple in the ArticleCategory table
	has_many :article_categories
	#all articles have one or more categories, defined by the tuple(s) in the ArticleCategory table
	has_many :categories, through: :article_categories
	
	validates :title, 
		presence: true,
		length: { minimum: 3, maximum: 50 }
		
	validates :description,
		presence: true,
		length: { minimum: 10, maximum: 300 }
		
	validates :user_id,
		presence: true
end