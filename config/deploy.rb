# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.19.1'

# Capistranoのログの表示に利用する
set :application, 'KY_management_app'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:nagai-sho/KY_management_app.git'
set :branch, 'main'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'storage')

set :rbenv_type, :user
set :rbenv_ruby, '3.2.0' #カリキュラム通りに進めた場合、’3.2.0’ です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                                  keys: ['~/.ssh/my-key-pair.pem'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    on roles(:app) do
      if test("[ -f #{shared_path}/tmp/pids/unicorn.pid ]") && test("ps -p $(cat #{shared_path}/tmp/pids/unicorn.pid}) > /dev/null")
        execute "kill -USR2 `cat #{shared_path}/tmp/pids/unicorn.pid`"
      else
        info "Unicorn is not running - skipping restart"
      end
      invoke 'unicorn:restart'
      execute "sudo systemctl restart nginx" # Nginx再起動を追加
    end
  end
end