class AddColumnToUploads < ActiveRecord::Migration[5.2]
  def change
    add_attachment :uploads, :file
  end
end
