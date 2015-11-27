class LoginController < ApplicationController
  skip_before_action :check_logined
  def index
  end

  def auth
    # 入力値がユーザー情報に存在するかどうか認証する
    ## 存在すれば対象のオブジェクト
    ## 存在しなければnil
    usr = User.authenticate(params[:userid],params[:password])
    if usr then
      # セッションの初期化
      reset_session
      # セッションに対象のユーザーのIDを保存
      session[:usr] = usr.id
      # 指定のリダイレクト先へ移動
      redirect_to tasks_path
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザーID/パスワードが間違っています。'
      render 'index'
    end
  end
  
  # ログアウトするアクション
  def destroy
    session[:usr] = nil
    reset_session
    redirect_to login_index_path
  end
end
