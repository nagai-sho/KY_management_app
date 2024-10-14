# README

# ポートフォリオ

### サービス名

### KY シート作成アプリ（仮）

http://52.197.7.233/

サービスの内容紹介

<!-- https://drive.google.com/file/d/1pGLJuOG060WsZI7NIPzQtleECEqa-6Wp/view?usp=drive_link -->

### 建設業界で毎日作成される、KY（危険予知）シート作成アプリ。

- 工事監督への負担軽減、ペーパーレスへの対応
- 作業者（職人）への省力化、ペーパーレスへの忌避感の軽減  
  上記を目標にしたアプリです。

# はじめに

2024/ 8/ 5 TECH CAMP 短期集中カリキュラムに参加（179 期）  
2024/10/11 TECH CAMP 短期集中カリキュラム終了

https://tech-camp.in/expert

## APP の作成動機

前職で働いていた際に、煩雑な事務処理がまだまだ紙ベースで行われていたので、  
今も前職で働くお世話になった方々が少しでも楽になれば良いなと思い、作成しました。

# 目次

- [アプリ制作にあたって](#アプリ制作にあたって)
- [アプリの概要](#アプリの概要)
- [環境](#環境)
- [技術選定](#技術選定)
- [開発手法](#開発手法)
<!-- - [課題定義](#課題定義) -->
- [要件定義](#要件定義)
<!-- - [業務フロー](#業務フロー) -->
- [ユースケース図](#ユースケース図)
  <!-- - [画面遷移図](#画面遷移図) -->
  <!-- - [プロトタイプ](#プロトタイプ) -->
- [データベース設計](#データベース設計)
<!-- - [システム構成図](#システム構成図) -->
- [追加実装予定](#追加実装予定)
<!-- - [修正点、修正必要箇所](#修正点、修正必要箇所) -->
- [学んだこと](#学んだこと)
- [まとめ](#まとめ)

# アプリ制作にあたって

[目次](#目次)

卒業課題として、オリジナルアプリを制作

## 制作理由

[目次](#目次)

- 実際、現場ではまだまだ紙ベースで運用されている
- 同様の機能のあるアプリ Web で調べると、導入までのカジュアルさに欠ける印象を受ける
- 多機能で、高額で、導入には企業への問い合わせが必要
- 無料のものはなく、無料を謳うアプリさえ、使用するユーザー数により従量課金制
- お試しでの使用にも、企業への問い合わせが必要
- 工事現場では、職人は個人事業主、中小企業が非常に多く、アプリの運用には元請けはもとより、末端への負担も強いることになる
- また、職人の中には電子機器の扱いへの忌避感が強い人も多い
- 無料で、フランクに、かつスマホなどの操作が苦手な人にも使いやすいものである必要がある

## アプリ制作における比較対象の調査

- 現場守（げんばもり）  
  → 低価格で使用可能というだけで、無料ではない  
  → 利用には販売代理店への問い合わせが必要
- Platio（プラティオ）  
  → 体験版しかない、申請に手続きが必要
- Google スプレッドシート、Excel  
  → 全て自身で作成する必要がある  
  → 最低限の関数などの知識がないと紙に手書きでの作成と遜色がなくなってしまう

# アプリの概要

[目次](#目次)

- 工事現場における KY シート（危険予知対策指示書）の簡易な作成、出力

# 環境

[目次](#目次)

- Mac Apple M1, 8GB, Sequoia 15.0.1

### 環境構築

- デプロイ → AWS

# 技術選定

[目次](#目次)

- Ruby on Rails
  - Ruby
  - HTML
  - scss
  - javascript

# 開発手法

[目次](#目次)

- issue 駆動開発（簡易）

### ブランチ構成、運用

- main（マージ,デプロイのみ）
- develop（README.md はここで編集）
- 機能ごとの作業ブランチ

<!-- # 課題定義 -->

# 要件定義

[目次](#目次)

## 機能要件

- サインイン、ログイン機能
- 現場名の作成、一覧表示機能
- 各現場内の工事名の作成、一覧表示機能
- KY シートの入力フォーム
- KY シートの入力フォームで用いる各セレクトボックスの登録、一覧表示機能
- KY シートの入力フォームへのサイン記入機能
- KY シートの入力フォームの QR コード生成機能
- KY シートの PDF プレビュー機能
- KY シートの PDF 保存、一覧表示機能

<!-- # 業務フロー

[目次](#目次) -->

# ユースケース図

[目次](#目次)

<!-- # 画面遷移図

[目次](#目次) -->

[ユースケース図、兼、画面遷移図](https://drive.google.com/file/d/1Qs6gcXOs-DwiklWu42T9T1Luf_Wod-4-/view?usp=drive_link)

https://drive.google.com/file/d/1Qs6gcXOs-DwiklWu42T9T1Luf_Wod-4-/view?usp=drive_link

<!-- # プロトタイプ

[目次](#目次)

# モックアップ

[目次](#目次) -->

# データベース設計

[目次](#目次)

[ＥＲ図](https://drive.google.com/file/d/1j2Bng_aPMu31Afp3_ogDurU6pZRSrTXw/view?usp=drive_link)

https://drive.google.com/file/d/1j2Bng_aPMu31Afp3_ogDurU6pZRSrTXw/view?usp=drive_link

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| company            | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| encrypted_password | string | null: false               |
| mail               | string | null: false, unique: true |
| phone_number       | string | null: false, unique: true |
| position           | string |                           |

### Association

- has_many :sites, through :user_sites
- has_many :user_sites
- has_many :ky_sheets

## user_sites テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| site_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :site

## sites テーブル

| Column      | Type   | Options                   |
| ----------- | ------ | ------------------------- |
| name        | string | null: false, unique: true |
| postal_code | string |                           |
| address     | string |                           |

### Association

- has_many :users, through :user_sites
- has_many :user_sites
- has_many :site_risk_predictions
- has_many :site_risk_measures
- has_many :safety_risk_predictions
- has_many :safety_risk_measures
- has_many :quality_risk_predictions
- has_many :quality_risk_measures
- has_many :construction_contents
- has_many :locations
- has_many :projects

## site_risk_predictions テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## site_risk_measures テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## safety_risk_predictions テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## safety_risk_measures テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## quality_risk_predictions テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## quality_risk_measures テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## locations テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | string  | null: false                    |

### Association

- belongs_to :site

## construction_contents テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| site_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :site

## projects テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------- | ------------------------------ |
| site_id                 | integer | null: false, foreign_key: true |
| name                    | string  | null: false                    |
| client                  | string  |                                |
| construction_start      | date    |                                |
| construction_completion | date    |                                |
| construction_content    | text    |                                |

### Association

- belongs_to :site
- has_many :ky_sheets

## ky_sheets テーブル

| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| project_id        | integer | null: false, foreign_key: true |
| user_id           | integer | null: false, foreign_key: true |
| construction_date | string  | null: false                    |

### Association

- belongs_to :project
- belongs_to :user
- has_one :outputs
  **ActiveHash**
  |:-|
- has_many :risk_levels
- has_many :incidence_rates
- has_many :construction_types

## outputs テーブル

| Column                             | Type    | Options                        |
| ---------------------------------- | ------- | ------------------------------ |
| ky_sheet_id                        | integer | null: false, foreign_key: true |
| location_id                        | integer | null: false, foreign_key: true |
| construction_content_id            | integer | null: false, foreign_key: true |
| site_risk_prediction_id            | integer | null: false, foreign_key: true |
| site_risk_measure_id               | integer | null: false, foreign_key: true |
| site_risk_level_1_id               | integer | null: false                    |
| site_risk_level_2_id               | integer | null: false                    |
| site_incidence_rate_1_id           | integer | null: false                    |
| site_incidence_rate_2_id           | integer | null: false                    |
| safety_risk_prediction_id          | integer | null: false, foreign_key: true |
| safety_risk_measure_id             | integer | null: false, foreign_key: true |
| safety_risk_level_id               | integer | null: false                    |
| safety_incidence_rate_id           | integer | null: false                    |
| quality_risk_prediction_id         | integer | null: false, foreign_key: true |
| quality_risk_measure_id            | integer | null: false, foreign_key: true |
| quality_risk_level_id              | integer | null: false                    |
| quality_incidence_rate_id          | integer | null: false                    |
| construction_type_id               | integer | null: false                    |
| priority_measure_content           | text    | null: false                    |
| priority_measure_risk              | text    | null: false                    |
| priority_measure                   | text    | null: false                    |
| priority_measure_risk_level_id     | integer | null: false                    |
| priority_measure_incidence_rate_id | integer | null: false                    |

### Association

- belongs_to :ky_sheet

# 追加実装予定

[目次](#目次)

- （優先順位順）

- [ ] HTTPS 化
- [ ] 独自ドメインの取得
- [ ] ユーザー登録時の Email アドレス確認メール送信機能
- [ ] ユーザーへのエラーを日本語表示に変換
- [ ] 所属会社以外の内容が見れない機能
- [ ] 現場や工事の検索機能
- [ ] CI/CD の導入（IaC の実装）
- [ ] AWS 無料枠のデータベース用サーバ立上げ、切離し
- [ ] Docker の導入
- [ ] 運用（エラー）監視機能の実装
- [ ] 現場削除用の管理者権限の実装
- [ ] テスト自動化（IaC の追加実装）
- [ ] サブスクライブ課金機能
- [ ] お問合せフォーム
- [ ] 消去したファイルの一時保存・復元機能
- [ ] 工事ごとの実施済み KY シート一括ダウンロード機能
- [ ] フォーマット作成機能
- [ ] 設定時間通知機能（バッチ処理）
- [ ] ワンクリック捺印機能
- [ ] 承認ワークフロー通知機能
- [ ] 最も最近使用した KY シートの表示機能
- [ ] Polymorphic 関連付けの導入によるテーブル数の削減（運用後のアクセス状況観察にて判断）
- [ ] ロードバランサー、CDN の検討（運用後のアクセス状況観察にて判断）
- [ ] 施工業者ごとで KY シートを作成できる機能（指示事項のフィルタリング機能）

<!-- # 修正点、修正必要箇所

- [目次](#目次) -->

# 学んだこと

[目次](#目次)

- AI の使い方
- 新しい技術の学び方

# まとめ

[目次](#目次)

- 初めて仮にもフルスタックでアプリ作成を試みて、時間の無さと、物の知らなさと、コードの具現化が非常に難しいものであるということを思い知らされました。それはある程度においては仕方がないものであり、妥協と機能要件における折り合いを見極める必要性があると思いました。  
  　自身で作成するアプリは難しいながらも面白く、尚且つしたいことが次から次へと溢れてくるので、上記の感想を踏まえ、最も大切なことは最小限でデプロイすることだと気付きました。  
  　その上で、ユーザー体験を損ねないように、より良いアプリにしていくという意識を持つことができ、自身のアプリがあるということの楽しさは他では感じられない貴重な経験であると思います。  
  　今後は貪欲に未だ見ぬ技術を吸収し、それをもとに様々な環境で活躍できる人材になれるよう好奇心旺盛であり続けたいと思います。
