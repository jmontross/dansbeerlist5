class AddGravatarContentTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_content_type, :string

  end
end
