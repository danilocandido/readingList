class Book < ApplicationRecord

	
	scope :finished, -> { where.not(finished_on: nil) }
	#scope :finished, -> { where('finished_on IS NOT NULL') }
	scope :recent, -> { where('finished_on > ?', 2.days.ago) }
	scope :search, -> (keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }

	before_save :set_keywords

	# A scope always return a collection a class method could return nil
	#def self.search(keyword)
	#	if keyword.present?
	#		where(title: keyword)
	#	else
	#		all
	#	end
	#end

	def finished?
		finished_on.present?
	end

	protected
		#this will helf the search of books
		def set_keywords
			self.keywords = [title, author, description].map(&:downcase).join(' ')
		end
end
