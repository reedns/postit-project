class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, :post

      t.timestamps
    end
  end
end
