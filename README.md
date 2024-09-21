# README

# はじめに

2024/ 8/ 5 TECH CAMP 短期集中カリキュラムに参加（179 期）
2024/10/11 TECH CAMP 短期集中カリキュラム終了予定

https://tech-camp.in/expert

## APP の作成動機

前職で働いていた際に、煩雑な事務処理がまだまだ紙ベースで行われていたので、
今も前職で働くお世話になった方々が少しでも楽になれば良いなと思い、作成しました。

# 目次

- アプリ制作あたって
- アプリの概要
- 開発手法
- 課題定義
- 要件定義
- 業務フロー
- ユースケース図
- 画面遷移図
- プロトタイプ
- ER 図
- 選定技術
- システム構成図
- 追加実装予定
- 修正点、修正必要箇所
- 学んだこと
- まとめ

# アプリ作成にあたって

卒業課題として、オリジナルアプリを制作

## 制作理由

- 実際、現場ではまだまだ紙ベースで運用されている
- その理由は何か
- 同様の機能のあるアプリ Web で調べると、導入までのカジュアルさに欠ける印象を受ける
- 多機能で、高額で、導入には企業への問い合わせが必要
- 無料のものはなく、無料を謳うアプリさえ、使用するユーザー数により従量課金制
- お試しでの使用にも、企業への問い合わせが必要
- 工事現場では、職人は個人事業主、中小企業が非常に多く、アプリの運用には元請けはもとより、末端への負担も強いることになる
- また、職人の中には電子機器の扱いへの忌避感が強い人も多い
- 無料で、フランクに、かつスマホなどの操作が苦手な人にも使いやすいものを開発

## アプリ制作における比較対象の調査

- 現場守（げんばもり）
  → 低価格で使用可能というだけで、無料ではない
  → 利用には販売代理店への問い合わせが必要
- Platio（プラティオ）
  → 体験版しかない、申請に手続きが必要
- Google スプレッドシート、Excel
  → 全て自身で作成する必要がある
  → 最低限の関数などの知識がないと紙に手書きでの作成と遜色がなくなってしまう

# 開発手法

- テスト駆動開発

# 機能要件

# 追加実装予定機能

# モックアップ

# データベース設計

[text](https://drive.google.com/file/d/18R9irW3OTEnGK___6-1126s_cm36ltzt/view?usp=drive_link)

## users テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| company      | string | null: false               |
| name         | string | null: false               |
| name_kana    | string | null: false               |
| password     | string | null: false               |
| mail         | string | null: false, unique: true |
| phone_number | string | null: false, unique: true |
| position     | string |                           |

### Association

- has_many :sites, through :users_sites

## users_sites テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| site_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :site

## sites テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| postal_code | string |             |
| address     | string |             |

### Association

- has_many :users_sites
- has_many :users, through :users_sites
- has_many :site_risk_predictions
- has_many :site_risk_measures
- has_many :construction_projects

## site_risk_predictions テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | string  | null: false                    |

### Association

- belongs_to :site

## site_risk_measures テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | string  | null: false                    |

### Association

- belongs_to :site

## construction_projects テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| site_id                 | integer | null: false, foreign_key: true |
| name                    | string  | null: false                    |
| client                  | string  |                                |
| construction_start      | string  |                                |
| construction_completion | string  |                                |
| construction_content    | string  |                                |

### Association

- belongs_to :site
- has_many :ky_sheets

## ky_sheets テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| construction_project_id | integer | null: false, foreign_key: true |
| user_id                 | integer | null: false, foreign_key: true |
| construction_date       | string  | null: false                    |

### Association

- belongs_to :construction_project
- belongs_to :user
- has_many :locations
- has_many :actions
- has_many :safety_risk_predictions
- has_many :safety_risk_measures
- has_many :quality_risk_predictions
- has_many :quality_risk_measures
- has_many :output_datum
  **ActiveHash**
  |:-|
- has_many :output_datum

## locations テーブル

## actions テーブル

## safety_risk_predictions テーブル

## safety_risk_measures テーブル

## quality_risk_predictions テーブル

## quality_risk_measures テーブル

## output_datum テーブル
