require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
    holiday_hash.collect do |k,v|
      if k == :winter
              holiday_hash[k][:christmas] = supply
              holiday_hash[k][:new_years] = supply
              # holiday_hash[:winter].to_s.capitalize!.split.join = supply
      end
    end
  # holiday_hash[:winter][:new_years]
  # puts holiday_hash[:winter][:new_years]
  holiday_hash[:winter]
end

 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
  holiday_hash.collect do |k,v|
      if k == :spring
              holiday_hash[k][:memorial_day] = supply
              # holiday_hash[:winter] = supply
              # holiday_hash[:winter].to_s.capitalize!.split.join = supply
      end
    end
    holiday_hash[:winter][:memorial_day]
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

  holiday_hash[season] = {holiday_name => supply_array}
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.collect do |k,v|
      str = k.to_s.capitalize + ":"
      puts str
      v.collect do |x, y|
        val_str = "  " + x.to_s.split(/ |\_|\-/).map(&:capitalize).join(" ") + ": "
        y.each_with_index do |a, b|
          new_str = a.to_s.split(/ |\_|\-/)
          if a == 'BBQ'
            new_str = new_str.map(&:upcase).join(" ")
            val_str = val_str + new_str  
          else
            new_str = new_str.map(&:capitalize).join(" ")  
            val_str = val_str + new_str
          if b < y.length - 1 
           val_str = val_str + ", "
          end
          end
          end
          puts val_str
        end
      end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = []
  holiday_hash.each do |k, v|
    v.each do |holiday, supplies|
           array << holiday if supplies.include?("BBQ")
    end 
  end
 array
end







