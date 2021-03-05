# This is the category model which has many posts
class Category < ApplicationRecord
    has_many :posts
end
