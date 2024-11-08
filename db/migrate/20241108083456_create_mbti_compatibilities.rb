class CreateMbtiCompatibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :mbti_compatibilities do |t|
      t.references :mbti_type, null: false, foreign_key: { to_table: :mbti_types }
      t.references :compatible_mbti_type, null: false, foreign_key: { to_table: :mbti_types }
      t.integer :score, null: false

      t.timestamps
    end
  end
end
