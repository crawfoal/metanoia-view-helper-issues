class ClimbLog < ActiveRecord::Base
  belongs_to :athlete_story
  validates_presence_of :athlete_story
  belongs_to :climb
  validates_presence_of :climb
  scope :in_section, ->(section) do
    joins(:climb).where(climbs: { section_id: section.id })
  end
  delegate :grade, :color, to: :climb
end
