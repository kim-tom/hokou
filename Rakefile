# coding: utf-8
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'seed-fu'

namespace :db do
  task :seed_fu do
    SeedFu.seed
  end

  task :load_config do
    require './hokou' # FIXME ActiveRecordの設定を行っているファイルを指定します。環境に合わせてパスを修正してください。
  end
end

Rake::Task['db:seed_fu'].enhance(['db:load_config'])
