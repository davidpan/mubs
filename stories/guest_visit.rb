require File.join(File.dirname(__FILE__).gsub(/stories(.*)/,"stories"),"helper")

with_steps_for :webrat, :navigation, :database do
  run_story(File.expand_path(__FILE__))
end

