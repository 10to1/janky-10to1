require "janky"
require "janky/chat_service/hubot"
Janky.setup(ENV)
require "janky/tasks"

desc "Truncate parts of the database"
task :remove_builds_and_commits do
  Janky::Build.delete_all
  Janky::Commit.delete_all

  require "janky/chat_service/hubot"
  Janky::ChatService.speak("[ci] Ik heb alle builds en alle commits weggegooid. #yolo", "#general")
end
