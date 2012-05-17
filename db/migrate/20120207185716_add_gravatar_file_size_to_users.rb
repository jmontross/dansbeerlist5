class AddGravatarFileSizeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_file_size, :integer

  end
end
