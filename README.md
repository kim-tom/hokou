# 補講検索システム
SinatraでModelからViewからControllerまで作ってみた。<br>
- パスワードはsaltをつけてハッシュ化したものを管理。データベースはPostgreSQLをRubyのActiveRecordから操作して、
データベース作って(migrate)、初期化(seed)した。
- hokou.rbでhttpsリクエストを処理して、リダイレクト、ログイン認証、セッション管理、補講データAPIの提供をしている。
- public/hokousearch.jsはhokou.rbが提供するAPIから取得したデータをhtmlに変換する。

学生アカウント(学年ごとに補講が見れる）<br>
id: student, pw: pass_stu<br>
教師アカウント(補講を追加できる）<br>
id: teacher, pw: pass_tchr<br>

https://hokou.herokuapp.com/login
