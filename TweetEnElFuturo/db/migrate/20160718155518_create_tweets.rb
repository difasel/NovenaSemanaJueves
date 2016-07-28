class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :usertw, index: true
      t.string :job_id
      t.string :tweet

      t.timestamp
    end
  end
end
