class TodoInside < ApplicationRecord
  belongs_to :todo_list
  belongs_to :user
  belongs_to :book

  scope:completed, ->do 
  where(completed:true)
  end
end
