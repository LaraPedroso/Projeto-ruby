class AddCommentFk < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :comment, foreign_key: true
  end
end
