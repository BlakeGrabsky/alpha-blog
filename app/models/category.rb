class Category < ApplicationRecord
	
	#all categories can be found in multiple tuples of the ArticleCategory table
	has_many :article_categories
	#all categories can be assigned to many articles
	has_many :articles, through: :article_categories

	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	validates_uniqueness_of :name
end