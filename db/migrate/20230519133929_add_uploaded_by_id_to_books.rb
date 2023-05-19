class AddUploadedByIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :uploaded_by_id, :string
  end
end
