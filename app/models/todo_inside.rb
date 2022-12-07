class TodoInside < ApplicationRecord
  belongs_to :todo_list
  belongs_to :login_user
  belongs_to :book
  has_rich_text :description

  scope:completed, ->do 
  where(completed:true)
  end
end
