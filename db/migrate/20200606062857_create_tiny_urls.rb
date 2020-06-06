class CreateTinyUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :tiny_urls do |t|
      t.string :code
      t.references :upload, foreign_key: true
      t.timestamps
    end
  end
end
