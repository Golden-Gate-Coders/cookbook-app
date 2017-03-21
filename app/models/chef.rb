class Chef < ApplicationRecord

  has_many :recipes
  # def recipes
  #   Recipe.where(chef_id: id)
  # end

end
