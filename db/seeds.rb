# db/seeds.rb

# List of teams
teams = [
  "Germany", "Scotland", "Hungary", "Switzerland",
  "Spain", "Serbia", "Slovakia", "England",
  "Italy", "Ukraine", "North Macedonia", "Netherlands",
  "Croatia", "Türkiye", "Wales", "Belgium",
  "Poland", "Czechia", "Albania", "Austria",
  "France", "Portugal", "Denmark", "Romania"
]

# Find or create teams in the database
teams.each do |team_name|
  Team.find_or_create_by(name: team_name)
end

# List of friends and their sets with multipliers
friend_sets = {
  "Lewis" => { teams: ["Germany", "England"], multiplier: 2 },
  "Claire" => { teams: ["Spain", "France"], multiplier: 1.5 },
  "Ben" => { teams: ["Italy", "Portugal"], multiplier: 2 },
  "Aimee" => { teams: ["Netherlands", "Croatia"], multiplier: 1.5 },
  "Sam" => { teams: ["Belgium", "Denmark"], multiplier: 1.2 },
  "Ella" => { teams: ["Poland", "Romania"], multiplier: 1.3 },
  "Craig" => { teams: ["Switzerland", "Austria"], multiplier: 1.1 },
  "Emma" => { teams: ["Scotland", "Ukraine"], multiplier: 1.4 },
  "Richard" => { teams: ["Serbia", "Slovakia"], multiplier: 1.2 },
  "Nhien" => { teams: ["Hungary", "Türkiye"], multiplier: 1.3 },
  "Jamie" => { teams: ["Wales", "Czechia"], multiplier: 1.4 },
  "Matt" => { teams: ["Albania", "North Macedonia"], multiplier: 1.1 }
}

# Create friends and their sets
friend_sets.each do |friend_name, set_info|
  friend = Friend.find_or_create_by(name: friend_name)
  set_info[:teams].each do |team_name|
    team = Team.find_by(name: team_name)
    FriendSet.create(friend_id: friend.id, team_id: team.id, name: "#{friend_name} Set #{team_name}", multiplier: set_info[:multiplier])
  end
end
