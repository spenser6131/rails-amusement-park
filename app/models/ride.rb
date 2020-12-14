class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.not_enough_tickets && !self.too_short
      "Sorry. " + ticket_notice
    elsif !self.not_enough_tickets && self.too_short
      "Sorry. " + height_notice
    elsif self.not_enough_tickets && self.too_short
      "Sorry. " + ticket_notice + " " + height_notice
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_enough_tickets
    user.tickets < attraction.tickets
  end

  def too_short
    user.height < attraction.min_height
  end

  def ticket_notice
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_notice
    "You are not tall enough to ride the #{attraction.name}."
  end

end
