set :application, "rails.si"
set :domain, "racker-deploy"
set :deploy_to, "/webroot/rails.si"
set :repository, 'git@github.com:mihar/RoR.si-rails.si.git'
set :scm, 'git'

namespace :vlad do
  
  desc "Symlinks stuff"
  remote_task :symlink do
    puts "Linking shared stuff to current release..."
    run "ln -s #{shared_path}/database.yml #{current_release}/config"
    run "ln -s #{shared_path}/assets #{current_release}/public/assets"
  end
  
  remote_task :update do 
    Rake::Task['vlad:symlink'].invoke
  end
  
  desc "Deploy application"
  remote_task :deploy do 
    system("git push")    
    Rake::Task['vlad:update'].invoke
    Rake::Task['vlad:migrate'].invoke
    Rake::Task['vlad:start_app'].invoke
    Rake::Task['vlad:notify_hoptoad'].invoke
  end

  task :notify_hoptoad => [:git_user, :git_revision] do
    notify_command = "rake hoptoad:deploy TO=#{rails_env} REVISION=#{current_sha} REPO=#{repository} USER='#{current_user}'" 
    puts "Notifying Hoptoad of Deploy (#{notify_command})" 
    `#{notify_command}`
    puts "Hoptoad Notification Complete." 
  end

  remote_task :git_revision do
    set :current_sha, run("cd #{File.join(scm_path, 'repo')}; git rev-parse origin/master").strip
  end

  task :git_user do
    set :current_user, `git config --get user.name`.strip
  end

  desc "Cleanup SASS leftovers"
  remote_task :cleanup_sass do
    puts "Cleaning up SASS leftovers..."
    run "rm #{current_release}/public/stylesheets/style.css;"
  end
  
  remote_task :start_app => :cleanup_sass
end