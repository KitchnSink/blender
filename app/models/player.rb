class Player
  include Mongoid::Document

  before_create :add_status
  field :gamedata, type: Hash, default: {}

  embedded_in :user
  embeds_one :status, validate: false
  # has_and_belongs_to_many :achievements, validate: false
  has_many :experience, validate: false

  def total_experience
    # self.experience.
  end

  private

    def add_status
      # create player status object with defaults
      self.status.create
    end

end
