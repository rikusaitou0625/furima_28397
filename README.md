# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| confirm          | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column | Type       | Options                        |
| ------ | ------     | ------------------------------ |
| text   | string     | null: false                    |
| image  | string     | null: false                    |
| user_id| references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- 

## orders テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| address_id   | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :adress


## adress テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| order_id       | references | null: false  foreign_key: true                           |
| card_number    | string     | null: false, foreign_key: true |
| valid          | string     | null: false, foreign_key: true |
| security_code  | string     | null: false                    |
| post_number    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| adress         | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |


### Association

- belongs_to :room
- has_one :order