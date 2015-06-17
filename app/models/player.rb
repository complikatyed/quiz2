class Player < ActiveRecord::Base
# NEED SOME WAY TO STRIP CELL PHONE NUMBER IN ORDER TO VALIDATE IT...

  validates :first_name, :last_name, :email, :cell, :points, :negs, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :cell, format: { :with => /\A(\+1)?[0-9]{10}\z/, :message => "Not a valid 10-digit telephone number" }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }
end
