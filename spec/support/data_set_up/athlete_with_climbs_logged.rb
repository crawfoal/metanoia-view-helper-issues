module DataSetUp
  def self.athlete_with_climbs_logged
    athlete = FactoryGirl.create :athlete
    log_climbs for_user: athlete, at_gym: FactoryGirl.create(:tiny_boulder_gym)
    log_climbs for_user: athlete, at_gym: FactoryGirl.create(:tiny_route_gym)
    return athlete
  end

  def self.log_climbs(for_user: , at_gym: )
    3.times do
      section = at_gym.sections.sample
      Faker::Number.between(1,3).times do
        climb = section.climbs.sample
        ClimbLogger.new({ climb_id: climb.id }, for_user).log
      end
    end
  end
end
