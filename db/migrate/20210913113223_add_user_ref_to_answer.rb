class AddUserRefToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :user
    add_foreign_key :answers, :users
  end
end
