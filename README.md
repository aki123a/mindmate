# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| mbti_type          | references | null: false, foreign_key: true |

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :initiated_matches, class_name: 'Match', foreign_key: 'user1_id'
- has_many :received_matches, class_name: 'Match', foreign_key: 'user2_id'
- belongs_to :mbti_type

## mbti_types テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| type_name               | string | null: false |
| description              | text |

- has_many :users 

## rooms テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :room

## messages テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text | null: false |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :room

## matches テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user1_id           | references | null: false, foreign_key: true |
| user2_id           | references | null: false, foreign_key: true |
| status             | string | default: "pending" |

- `belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'`
- `belongs_to :user2, class_name: 'User', foreign_key: 'user2_id'`
