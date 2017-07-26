class Book < ApplicationRecord

	scope :finished, -> { where.not(finished_on: nil) }
	#scope :finished, -> { where('finished_on IS NOT NULL') }
	scope :recent, -> { where('finished_on > ?', 2.days.ago) }

	def finished?
		finished_on.present?
	end
end
