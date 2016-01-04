１：マイグレーションをする。
　　rails g migration AddAgeToMessage age:integer 
　　db/migrate/フォルダの中にファイルができるのでそれをチェックする。
　　
　　Messageクラスに属性ageを追加するので、messagesテーブルにageカラムを追加するわけです。
　　
　　http://guides.rubyonrails.org/association_basics.html
　　http://railsguides.jp/active_record_migrations.html
　　
　　今回は　add_column というメソッドを記述することになります。
　　
　　rake db:migrateを実行してマイグレーションを完了させます。
　　
２：viewを編集する

    app/views/_form.html.erbの中にあるform_forの中身にageを編集できるtext_fieldを追加する。
    
3 :controllerを編集する

    app/controllers/messages_controller.rbにmessage_paramsのpermitとしてageも許可するように設定する。
　　
４：viewを編集する
    
    app/views/index.htmlの中でmessageの内容を表示している部分にageも表示されるようにコード絵を追加する。

５：modelにバリデーションを追加する。
    Messageモデルにageのバリデーションを追加。
    numericalityを使う。
    http://railsguides.jp/active_record_validations.html    

Twitterクローンの場合は

1：マイグレーションする。
　Userクラスにプロフィールと地域を追加する。
　
２：viewを編集するview
    views/users/edit.html.erbを作成する。
    ここには編集できるフォームがあるべきです。
    views/users/new.html.erbの内容とほとんど同じになるでしょう。

3：controllerを編集する
    app/controllers/users_controller.rbにeditとupdateアクションを追加する。
    user_paramsメソッド内のpermitの部分も忘れずにプロフィールと地域を許可するようにしてください。
    
４：views/users/show.html.erbを編集する。
　ここに新しく追加したプロフィールと地域の内容を表示させるようにコードを追加する。
　
５：modelにバリデーションを追加する
    profileとareaにバリデーションを追加する。
    文字数制限など。

６：自分しか編集できないようにする。
　controller内でcurrent_userとUser.find(params[:id])で持ってきたユーザーが
　一緒かどうかを確認すればよい。
　redirect_to root_path unless(current_user == @user)
　このコードをeditとupdateの内容が実行される前。