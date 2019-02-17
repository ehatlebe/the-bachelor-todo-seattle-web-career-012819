require 'pry'

# takes 2 arguments, a hash called data and a season, then returns the first name of that season's winner
def get_first_name_of_season_winner(data, season)
  data[season].each do |this_contestant|
    if this_contestant["status"].downcase == "winner"
      return this_contestant["name"].split(" ").first
    end
  end
end

# takes in the data hash and an occupation string and returns the name of the woman who has that occupation
def get_contestant_name(data, occupation)
  data.each do |season, all_contestants|
    all_contestants.each do |this_contestant|
      if this_contestant["occupation"].downcase == occupation.downcase
        return this_contestant["name"]
      end
    end
  end
end

# return a counter of the number of contestants who are from that hometown
def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, all_contestants|
    all_contestants.each do |this_contestant|
      if this_contestant["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

# returns the occupation of the 1st contestant who hails from that hometown
def get_occupation(data, hometown)
  data.each do |season, all_contestants|
    all_contestants.each do |this_contestant|
      if this_contestant["hometown"] == hometown
        return this_contestant["occupation"]
      end
    end
  end
end

# return the average age of all of the contestants for that season
def get_average_age_for_season(data, season)
  age_total = 0
  contestants_total = 0
  data[season].each do |contestant_hash|
    age_total += (contestant_hash["age"]).to_i
    contestants_total += 1
  end
  (age_total / contestants_total.to_f).round(0)
end
