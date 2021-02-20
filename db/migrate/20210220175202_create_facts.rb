class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.text :body

      t.timestamps
    end
  end
end
