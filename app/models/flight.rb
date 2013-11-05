class Flight < ActiveRecord::Base
  has_many :seats
  belongs_to :airplane
end
