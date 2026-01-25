#This class is a base class that everything inherits from, and it is abstract.

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
