class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :github
      t.string :demo
      t.string :languages

      t.timestamps
    end
  end
end
