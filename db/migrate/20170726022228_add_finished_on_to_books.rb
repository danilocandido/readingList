class AddFinishedOnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :finished_on, :date
  end
end
