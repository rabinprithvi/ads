class Plan < ActiveRecord::Base
  has_many :features
  accepts_nested_attributes_for :features,  allow_destroy: true
end
