## itemsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             | string     | null: false                    |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| price             | integer    | null: false                    |
| item_condition_id | references | null: false, foreign_key: true |
| postage_type      | references | null: false, foreign_key: true |
| prefecture_code   | integer    | null: false                    |
| preparation_day   | references | null: false, foreign_key:true  |
| category_id       | references | null: false, foreign_key: true |
| seller_id         | references | null: false, foreign_key: true |
| buyer_id          | references | foreign_key: true              |
### Association
- has_many :comments
- belongs_to :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :preparation_day
- belongs_to :seller
- has_many :buyer



## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false, unique: true, index: true |
### Association
- has_many :seller_items
- has_many :buyer_items
- has_many :comments
- has_one :profile
- has_one :sending_destination
- has_one :credit_card



## commentsテーブル
| Column  | Type | Options     |
| ------- | ---- | ----------- |
| content | text | null: false |
### Association
- belongs_to :item
- belongs_to :user


## profilesテーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| family_name      | string     | null: false |
| first_name       | string     | null: false |
| family_name_kana | string     | null: false |
| first_name_kana  | string     | null: false |
| birth_year       | date       | null:false  |
| birth_month      | date       | null: false |
| birth_day        | date       | null: false |
| user_id          | references | null: false, foreign_key: true            |
### Association
- belongs_to :user



## sending_destinationテーブル
| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| destination_family_name      | string     | null: false                    |
| destination_first_name       | string     | null: false                    |
| destination_family_name_kana | string     | null: false                    |
| destination_first_name_kana  | string     | null: false                    |
| zip_code                     | integer    | null: false                    |
| prefecture                   | string     | null: false                    |
| city                         | string     | null: false                    |
| address                      | string     | null: false                    |
| building_number              | string     |                                |
| phone_number                 | integer    | null: false, unique: true      |
| user_id                      | references | null: false, foreign_key: true |
### Association
- belongs_to :user



## credit_cardsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false, unique: true      |
| exp_year      | integer    | null: false                    |
| exp_month     | integer    | null: false                    |
| security_code | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
### Association
- belongs_to :user



## categoriesテーブル (active_hash)
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | null: false |
### Association
- has_many :items



## item_conditionsテーブル (active_hash)
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| item_condition | string | null: false |
### Association
- has_many :items



## postage_typesテーブル (active_hash)
| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postage_type | string | null: false |
### Association
- has_many :items



## preparation_daysテーブル (active_hash)
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| preparation_day | string | null: false |
### Association
- has_many :items
