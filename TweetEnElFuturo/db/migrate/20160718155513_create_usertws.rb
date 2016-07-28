class CreateUsertws < ActiveRecord::Migration
  def change
    create_table :usertws do |u|
      u.string :user
      u.string :access_token
      u.string :access_token_secret

      u.timestamp
    end
  end
end
