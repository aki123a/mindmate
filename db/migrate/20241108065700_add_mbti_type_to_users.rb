class AddMbtiTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :mbti_type, null: false, foreign_key: true
  end
end
