class Flotilla
  attr_reader :name,
              :personnel,
              :ships

  def initialize(info)
    @name = info[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship)
    # recommended_personnel = []
    # @personnel.each do |person|
    #   if ship.requirements.keys == person.specialties && person.experience >= ship.requirements.values
    #   recommended_personnel << person
    #   end
    #   recommended_personnel
    # end
  end
  # option 2...
  # @ships.map do |ship|
  #   ship.requirements.select do |key, value|
  #     @personnel.map do |person|
  #       ship.requirements.key == person.specialties
  #
  #     end
  #   end
  # end

  def personnel_by_ship
  #   personnel_by_ship_hash = {}
  #
  #   @personnel.each do |person|
  #     personnel_by_each_hash[spacecreaft.name] = person
  #   end
  #   personnel_by_each_hash
  # end
end
