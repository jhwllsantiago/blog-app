class SetDefaultToZero < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tutorials, :upvotes, from: nil, to: 0
    change_column_default :tutorials, :downvotes, from: nil, to: 0
  end
end
