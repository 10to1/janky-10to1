require "janky"
require "janky/chat_service/hubot"
Janky.setup(ENV)
require "janky/tasks"

desc "Fire up a console"
task :console do
  require "janky"
  Janky.setup(ENV)
  ARGV.clear
  IRB.start
end

desc "Truncate parts of the database"
task :remove_builds_and_commits do
  date = ENV["DATE"] ? Date.parse(ENV["date"]) : 2.weeks.ago
  room = ENV["CHAT_ROOM"] || "#dev"

  builds = Janky::Build.where("created_at < ?", date)
  commits = Janky::Commit.where("created_at < ?", date)

  builds_count = builds.count
  commits_count = commits.count

  if builds_count > 100 || ENV["USE_THE_FORCE"]
    commits.destroy_all
    builds.destroy_all
    require "janky/chat_service/hubot"

    Janky::ChatService.speak("[ci] Ik heb #{builds_count} builds en #{commits_count} commits weggegooid. #yolo4life", room)
  end
end
