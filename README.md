# PLAY GAMES

ゲーム専用のメンバー募集アプリです。  
ゲーム内容を投稿して、一緒にプレイする人を募集します。  
レスポンシブ対応しているのでスマホからもご確認いただけます。  
<img width="1425" alt="c21c6354c2c4f17aa0ee189492e31d24" src="https://user-images.githubusercontent.com/64832157/85978336-79490a00-ba19-11ea-8e0d-9412432cdc63.png">

## 制作背景
ゲームが好きで募集アプリを利用していた際、「ここを変えればもっと使いやすな」と思っていたこと。また、募集専用アプリが少ないと感じ、制作しました。

## URL
http://playgames-pg.com/ 
* 「ゲストログイン」をクリックすると、メールアドレスとパスワードを入力せずにログインできます。  

## 言語・使用技術
* フロント
  * HTML
  * Scss
  * jQuery
  * bootstrap4

* バックエンド
  * Ruby 2.5.3
  * Ruby on Rails 5.2.4

* サーバー
  * Nginx

* DB
  * MySQL 5.7

* インフラ・開発環境等
  * Docker/docker-compose
  * AWS(EC2、S3、Route53、ALB, ACM)
  * CircleCI
  * Capistrano3
  * RSpec

  ## AWS構成図
  <img width="809" alt="4ffd4c566492cb25f7b628ce3e60c6bf" src="https://user-images.githubusercontent.com/64832157/85950583-9be70e80-b998-11ea-8b90-456df407b583.png">

## 実装機能
* ユーザー機能
  * deviseを使用
  * 新規登録・ログイン・ログアウト機能
  * マイページ・登録情報編集機能
* 記事投稿機能
  * 記事一覧表示、記事詳細表示、記事投稿、記事編集、記事削除機能
* 画像投稿機能
  * 画像のアップロードはcarrierwaveを使用
* コメント機能
  * コメント表示、コメント投稿
* いいね機能
  * 非同期通信を使用
* タグ機能
* ページネーション機能
  * kaminariを使用
* 検索機能
  * あいまい検索
* かんたんログイン機能
