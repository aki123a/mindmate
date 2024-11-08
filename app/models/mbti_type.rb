
class MbtiType < ApplicationRecord
  has_many :users

  # 自身が相性の元となるレコードを取得
  has_many :mbti_compatibilities
  # 自身が相性の対象となるレコードを取得
  has_many :compatible_mbti_compatibilities, class_name: 'MbtiCompatibility', foreign_key: :compatible_mbti_type_id
end