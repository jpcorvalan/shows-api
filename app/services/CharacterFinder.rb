class CharacterFinder

  def self.call(**params)
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    Character.find_by_name(params)
  end

  private

  attr_reader :params

end
