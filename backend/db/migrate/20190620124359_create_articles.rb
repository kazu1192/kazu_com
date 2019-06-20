class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :name
      t.string :context
      t.string :tag

      t.timestamps
    end
  end
end
