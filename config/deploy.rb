set :application, "rails.si"
set :domain, "racker-deploy"
set :deploy_to, "/webroot/rails.si"
set :repository, 'git@home:gvido.git'
set :scm, 'git'

namespace :vlad do
  
  desc "Symlinks stuff"
  remote_task :symlink do
    puts "Linking shared stuff to current release..."
    run "ln -s #{shared_path}/database.yml #{current_release}/config"
    run "ln -s #{shared_path}/gmaps.rb #{current_release}/config/initializers"
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
  end

  # desc "Cleanup SASS leftovers"
  # remote_task :cleanup_sass do
  #   puts "Cleaning up SASS leftovers..."
  #   run "rm #{current_release}/public/stylesheets/*.css;"
  # end
  # 
  # remote_task :start_app => :cleanup_sass
end