## itemsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| price             | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| postage_type      | integer    | null: false                    |
| prefecture        | integer    | null: false                    |
| preparation_day   | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
### Association
- has_many :comments
- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecure



## usersテーブル
| Column           | Type   | Options                                |
| ---------------- | ------ | -------------------------------------- |
| nickname         | string | null: false                            |
| email            | string | null: false                            |
| password         | string | null: false, unique: true, index: true |
| family_name      | string | null: false                            |
| first_name       | string | null: false                            |
| family_name_kana | string | null: false                            |
| first_name_kana  | string | null: false                            |
| birthday         | date   | null: false                            |
### Association
- has_many :comments
- has_many :items
- has_many :orders



## commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user



## sending_destinationsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| zip_code        | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_number | string     |                                |
| phone_number    | string     | null: false, unique: true      |
| order           | references | null: false, foreign_key: true |
### Association
- belongs_to :order
- belongs_to_active_hash :prefecture


## ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :address