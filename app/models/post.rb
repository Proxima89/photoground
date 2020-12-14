class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 2}
    validates :content, presence: true, length: {minimum: 2}, presence: { message: "Cant be empty" }
    validates :category, presence: true
    validates :photo, presence: true
    has_one_attached :photo
    belongs_to :category
end
