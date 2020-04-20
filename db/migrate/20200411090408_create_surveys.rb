class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.boolean :public
      t.string :state
      t.timestamps
    end
  end
end
