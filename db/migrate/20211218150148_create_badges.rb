class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_name, default: 'default_badge.svg'
      t.string :rule, null: false
      t.string :description, null: false 

      t.timestamps

      t.index :title, unique: true
    end

    create_join_table :badges, :users do |t|
      t.index :badge_id
      t.index :user_id
    end
  end
end
