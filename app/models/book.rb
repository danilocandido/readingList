class Book < ApplicationRecord

	
	scope :finished, -> { where.not(finished_on: nil) }
	#scope :finished, -> { where('finished_on IS NOT NULL') }
	scope :recent, -> { where('finished_on > ?', 2.days.ago) }
	scope :search, -> (keyword) { where(title: keyword) if keyword.present? }

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
end
