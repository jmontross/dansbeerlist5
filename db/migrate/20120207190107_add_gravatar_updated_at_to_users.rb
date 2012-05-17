class AddGravatarUpdatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_updated_at, :datetime

  end
end
