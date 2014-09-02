require_relative 'workout'
require 'csv'
require 'pry'
require 'table_print'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end
# binding.pry
  workouts
end
load_data = load_workout_data('workouts.csv')
# YOUR CODE HERE

workouts = []

load_data.each do |id, data|
  workouts << Workout.new(id, data[:date], data[:exercises])
end

tp workouts
