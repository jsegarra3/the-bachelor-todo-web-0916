require "pry"
def get_first_name_of_season_winner(data, season)
  winner=[]
  data[season].each do |contestant|
    if contestant["status"]=="Winner"
      winner=contestant["name"].split(" ")
    end
  end
  winner[0]
end

def get_contestant_name(data, occupation)
  woman = ""
  data.each do |season,contAry|
    contAry.each do |contestant|
      if contestant["occupation"]==occupation
        woman = contestant["name"]
      end
    end
  end
  woman
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season,contAry|
    contAry.each do |contestant|
      if contestant["hometown"]==hometown
        counter +=1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupy = ""
  data.find do |season, contAry|
    contAry.find do |contestant|
      if contestant["hometown"]==hometown
        occupy = contestant["occupation"]
      end
    end
  end
  occupy
end

def get_average_age_for_season(data, season)
  avgAge = 0.0
  totalAge = 0
  count = 0
  data[season].each do |contestant|
    totalAge += contestant["age"].to_i
    count +=1
  end
  avgAge = totalAge.to_f / count.to_f
  avgAgeString = avgAge.to_s.partition(".")
  if avgAgeString[2].to_i > 40
    avgAge = avgAge.ceil
  else
    avgAge = avgAge.floor
  end
  avgAge
end
