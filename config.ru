require "resolv-replace"
require "janky"
require "janky/chat_service/hubot"
require "shack"

sha = ENV["SOURCE_VERSION"]
Shack::Middleware.configure do |shack|
  shack.sha = sha
  shack.content = "{{short_sha}}"
end
use Shack::Middleware
Janky.setup(ENV)
run Janky.app
