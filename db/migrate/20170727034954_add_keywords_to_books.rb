class AddKeywordsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :keywords, :text
  end
end
