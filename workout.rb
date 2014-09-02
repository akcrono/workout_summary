class Workout
  attr_accessor(:id, :date, :duration, :type, :calories_burned)

  def initialize(id, date, exercises)
    @id = id
    @date = date
    @exercises = exercises
    @duration = get_duration(exercises)
    @type = get_type(exercises)
    @calories_burned = get_calories_burned(exercises)
  end

  def get_duration(exercises)
    total_calories_burned = 0
    exercises.each do |exercise|
      total_calories_burned += exercise[:duration_in_min]
    end
    total_calories_burned
  end

  def get_type(exercises)
    cardioCount = 0
    strengthCount = 0
    exercises.each do |exercise|
      if exercise[:category] == "cardio"
        cardioCount += 1
      elsif exercise[:category] == "strength"
        strengthCount += 1
      end
    end
    if cardioCount >= (exercises.count.to_f / 2).ceil
      return 'cardio'
    elsif strengthCount >= (exercises.count.to_f / 2).ceil
      return 'strength'
    else
      return 'other'
    end
  end

  def get_calories_burned(exercises)
    calories_burned = 0
    exercises.each do |exercise|
      if exercise[:category] == 'cardio'
        if exercise[:intensity] == 'high'
          calories_burned += exercise[:duration_in_min]*10
        elsif exercise[:intensity] == 'medium'
          calories_burned += exercise[:duration_in_min]*8
        else
          calories_burned += exercise[:duration_in_min]*5
        end
      elsif exercise[:category] == 'strength'
        calories_burned += exercise[:duration_in_min]*5
      else
        calories_burned += exercise[:duration_in_min]*6
      end
    end
    calories_burned
  end

end
