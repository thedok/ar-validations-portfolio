class Event < ActiveRecord::Base
	validates :organizer_name, :organizer_email, :title, :date, presence: true
	validates :title, uniqueness: true
	validates :organizer_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "You had the wrong email format" }
	validate :date_in_future

	def date_in_future
  	if self.date
  		errors.add(:date, "Cannot create an event in the past") if self.date < Date.today
  	end
  end

end
