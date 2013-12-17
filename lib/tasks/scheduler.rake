task :update => :environment do
  puts "Updating feed..."
  Game.update_game
  puts "done."
end