class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         belongs_to :mbti_type, optional: true

  validates :name, presence: true
  validates :mbti_type_id, presence: true

  def compatibility_with(other_user)
    compatibility = MbtiCompatibility.find_by(mbti_type: self.mbti_type, compatible_mbti_type: other_user.mbti_type)
    compatibility ? compatibility.score : 0
  end

  def compatible_users
    User.where.not(id: self.id).map do |user|
      { user: user, score: compatibility_with(user) }
    end.sort_by { |entry| -entry[:score] }
  end
end
