class Book < ApplicationRecord
    has_many :todo_lists
    mount_uploader :image, ImageUploader
end
