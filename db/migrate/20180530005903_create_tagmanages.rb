class CreateTagmanages < ActiveRecord::Migration
  def change
    create_table :tagmanages do |t|

      t.timestamps null: false
      t.references :tag, foreign_key: true
      t.references :prototype, foreign_key: true
    end
  end
end
