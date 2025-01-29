class AddTextToWelcomes < ActiveRecord::Migration[7.2]
  def change
    add_column :welcomes, :greeting, :string
  end
end
