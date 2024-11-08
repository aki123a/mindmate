class MbtiCompatibility < ApplicationRecord
  belongs_to :mbti_type
  belongs_to :compatible_mbti_type, class_name: 'MbtiType'
end