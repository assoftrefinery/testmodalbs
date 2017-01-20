class AddFotoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :foto, :string
  end
end
