class ApplicationRecord < ActiveRecord::Base
  
  protect_from_forgery with: :exception 
  
end
