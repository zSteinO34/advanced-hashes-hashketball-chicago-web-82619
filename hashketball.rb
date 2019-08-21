require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }]
    }
  }
  
  hash
end

def num_points_scored(player_name)
  player_points = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      if players.include?(player_name)
        player_points = players[player_name][:points]
      end
    }
  }  
  player_points
end

def shoe_size(player_name)
  size = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      if players.include?(player_name)
        size = players[player_name][:shoe]
      end
    }
  }  
  size
end

def team_colors(team_name)
  colors = []
  game_hash.each { |team, details|
    if details[:team_name].include?(team_name)
      colors = details[:colors]
    end
  }  
  colors
end

def team_names
  teams = []
  game_hash.each { |team, details|
   teams << details[:team_name] 
  }
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each { |team, details|
    if details[:team_name].include?(team_name)
      details[:players].each { |players|
        players.each { |name, stats|
          numbers << stats[:number]
        }
      }
    end
  }  
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each { |team, details|
    details[:players].each { |players|
      if players.include?(player_name)
        stats = players[player_name]
      end
    }
  }  
  stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      players.each { |name, stats|
        if stats[:shoe] > shoe_size
          rebounds = stats[:rebounds]
          shoe_size = stats[:shoe]
        end
      }
    }
  }  
  rebounds
end

def most_points_scored
  player = ""
  points = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      players.each { |name, stats|
        if stats[:points] > points
          player = name
          points = stats[:points]
        end
      }
    }
  }  
  player
end

def winning_team
  home = 0
  away = 0
  game_hash[:home][:players].each { |teammates|
    teammates.each { |name, stats|
      home += stats[:points]
    }
  }
  game_hash[:away][:players].each { |teammates|
    teammates.each { |name, stats|
      away += stats[:points]
    }
  }
  if home > away
    game_hash[:home][:team_name]
  elsif away > home
    game_hash[:away][:team_name]
  else
    p "The score is tied"
  end
end

def player_with_longest_name
  player = ""
  name_length = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      players.each { |name, stats|
        if name.size > name_length
          player = name
          name_length = name.size
        end
      }
    }
  }  
  player
end

def long_name_steals_a_ton?
  player_long_name = ""
  name_length = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      players.each { |name, stats|
        if name.size > name_length
          player_long_name = name
          name_length = name.size
        end
      }
    }
  }  
  player_long_name
  player_most_steals = ""
  steals = 0
  game_hash.each { |team, details|
    details[:players].each { |players|
      players.each { |name, stats|
        if stats[:steals] > steals
          player_most_steals = name
          steals = stats[:steals]
        end
      }
    }
  }  
  if player_most_steals == player_long_name
    return true
  else
    return false
  end
end

