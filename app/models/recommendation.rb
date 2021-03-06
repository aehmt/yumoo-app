class Recommendation < ApplicationRecord
  belongs_to :food
  belongs_to :mood

  has_many :ratings


  def rating
    rating_scores = self.ratings.map do |rating|
      rating.score
    end
    rating = rating_scores.reduce(:+).fdiv(rating_scores.size).round(1)

    self.rating = rating
    self.save
    rating
  end

  def self.recommend(mood = Mood.all.sample, limit = 5)
    where('mood_id = ?', mood.id).order('rating DESC').limit( limit*2 ).sample(limit)
  end

  def greet
    now = Time.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      'morning'
    elsif (noon..evening).cover? now
      'afternoon'
    elsif (evening..night).cover? now
      'evening'
    elsif (night..tomorrow).cover? now
      'night'
    end
  end

end
