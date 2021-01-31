# 本アプリケーションについて

## アプリケーション名
- 「Kakomo(カコモ)」

## キャッチコピー
- 「おいしいを、囲もう。」

## アプリケーション概要
- 「オンライン飲み会に参加する人に共通のおつまみを食べてもらいたい」という思いから生まれた、コミュニケーションフードサービスです。おつまみをサイト上で注文し、参加者の自宅までお届けします。以前は当たり前だった「みんなで食卓を囲む」体験を、オンライン上で体験していただくことを目的にしています。

## 利用方法
- 幹事の方が代表でサイトからご注文ください。
- 「料理のジャンル」「シーン」「合わせたい飲み物」「アレルギー」のカテゴリーから検索が可能です。「おつまみ診断」では全てのカテゴリーから一括検索ができ、最適なおつまみをご提案します。
- お申し込み完了後、幹事様あてに参加者用個別フォームをお送りします。配送先、希望時間、アレルギーの有無などを参加者様が入力し、このフォームから送信していただきます。
- 飲み会前日または当日に、料理をお届けします。
- 飲み会終了後、口コミ投稿が可能です。

## 本アプリの制作動機
- コロナ禍で対面の飲み会ができなくなり、仲間と食卓を囲む時間が減ったことがきっかけです。私はもともと料理が大好きで、家に親しい人を呼んでは飲み会を開いて料理を振る舞うことを楽しみにしていました。みんなで同じ料理を囲んで話している時間はとても一体感を感じられる有意義な時間だったことに気づき、コロナ禍でも同じ体験ができるサービスを作りたいという思いから本アプリの制作を決めました。


## 目指した課題解決
- コロナ禍で、仲間とコミュニケーションを取る時間が減ってきています。本アプリでは人々に「一緒に食卓を囲む」時間を提供することで、人と人が繋がる時間を得ていただくことを目的としています。
- 今後ますます需要が高まることが予想されるオンライン飲み会。個人的な飲み会はもちろん、会社の歓送迎会にも手軽にご利用いただけるアプリを目指しました。
- ウーバーイーツの対象になりにくい居酒屋等の飲食店が参入しやすく、飲食業界の売上向上に貢献できます。
- 同じおつまみを食べることで飲み会を切り上げるタイミングもスマートに決められるため、オンライン飲み会の悩みである「終わりの時間がわからない」などの問題を解決できます。

## 洗い出した要件
- 新規登録／ログイン
- 商品出品
- 商品検索
- 商品購入
- 口コミ投稿

## 実装した機能についてのGIFと説明
- 新規登録／ログイン  
・必要事項を入力すると新規登録&ログインできます。  
・入力事項に誤りがあった場合、エラー文を表示します。  
・ログイン中ユーザーのみ出品画面に遷移できます（ログインしていないユーザーが出品画面に行こうとした場合、ログイン画面に遷移します）。

- 商品出品    
・複数条件を指定した上で商品を出品することができます。  

- 商品編集  
・出品後の商品の情報を編集できます。

- 商品削除
・出品後の商品を削除できます。  
・全商品が削除された場合、「今は注文できません」の表示が出ます。


## 実装予定の機能  
- 新規登録／ログイン  
・法人用／個人用の入り口を分け、法人は出品、個人は購入ができるようにします。  
・法人用／個人用それぞれにマイページを作成できるようにします。  

- 商品検索 （おつまみ診断）  
・「料理のジャンル」「シーン」「合わせたい飲み物」「アレルギー」といった条件を指定した上で、購入したい商品の検索ができるようにします。  
・上記全てのカテゴリーから一括検索ができる機能をつけ、よりお客様の好みに絞った商品を検索できるようにします。


- 商品購入  
・購入したい商品をクリック後、PAY.JPを通してクレジットカード決済ができるようにします。  
・参加者入力用フォームに配送先やアレルギー情報を入力して送信すると、情報が出店側に送られるようにします。  

- 口コミ投稿  
・ログイン中のユーザーが必要事項を入力すると、口コミを投稿することができるようにします。  


# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :foods
- has_many :orders

## Foods テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| price         | integer     | null: false                    |
| description   | text        | null: false                    |
| genre_id      | integer     | null: false                    |
| drink_id      | integer     | null: false                    |
| scene_id      | integer     | null: false                    |
| allergy_id    | integer     | null: false                    |
| day_id        | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## Orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| food    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food
- has_one  :destination

## Destinations テーブル

| Column                    | Type       | Options                            |
| ------------------------- | ---------- | ---------------------------------- |
| post_code                 | string     | null: false                        |
| prefecture_id             | integer    | null: false                        |
| city                      | string     | null: false                        |
| address                   | string     | null: false                        |
| building_name             | string     |                                    |
| phone_number              | string     | null: false                        |
| order                     | references | null: false, foreign_key: true     |

### Association

- belongs_to :order
