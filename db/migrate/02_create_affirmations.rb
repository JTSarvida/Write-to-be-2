class CreateAffirmations < ActiveRecord::Migration
  def change
    create_table :affirmations do |t|
      t.integer :user_id
      t.text :content
    end
  end
end
