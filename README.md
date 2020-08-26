# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |


### Association
- has_many :items
- has_many :orders


## items テーブル

| Column              | Type        | Options                        |
| ------              | ------      | ------------------------------ |
| image               | string      | null: false                    |
| name                | string      | null: false                    |
| info                | string      | null: false                    |
| category            | integer     | null: false                    |
| items_status        | integer     | null: false                    |
| shipping_fee        | integer     | null: false                    |
| prefecture          | integer     | null: false                    |
| scheduled_delivery  | integer     | null: false                    |
| price               | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true 
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress


## adress テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| order          | references | null: false  foreign_key: true |
| post_number    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| adress         | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |


### Association
- belongs_to :order