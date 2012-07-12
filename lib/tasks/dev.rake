# encoding: utf-8
namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
      puts "Create system user"
      #u = User.new( :login => "root", :password => "password", :email => "root@example.com", :name => "管理員")
      #u.is_admin = true
      #u.save!
  end
end