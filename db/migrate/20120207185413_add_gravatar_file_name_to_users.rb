class AddGravatarFileNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_file_name, :string

  end
end
