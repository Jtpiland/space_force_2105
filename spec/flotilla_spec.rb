require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

Rspec.describ Flotilla do

  it "exists" do

    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla).to be_a(Flotilla)
  end

  it "has attributes" do

    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla.name).to be_a('Seventh Flotilla')
    expect(seventh_flotilla.personnel).to be_a([])
    expect(seventh_flotilla.ships).to be_a([])
  end

  it "can add ships" do

    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    seventh_flotilla.add_ship(daedalus)

    expect(seventh_flotilla.ships).to eq([daedalus])
  end

  it "can add people" do

    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    kathy = Person.new('Kathy Chan', 10)
    polly = Person.new('Polly Parker', 8)
    rover = Person.new('Rover Henriette', 1)
    sampson = Person.new('Sampson Edwards', 7)
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})

    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh_flotilla.personnel).to eq([kathy, polly, rover, sampson])
  end

  it "can recommend personnel" do

    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    kathy = Person.new('Kathy Chan', 10)
    polly = Person.new('Polly Parker', 8)
    rover = Person.new('Rover Henriette', 1)
    sampson = Person.new('Sampson Edwards', 7)
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})

    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh_flotilla.recommend_personnel(daedalus)).to eq([kathy, sampson])
  end

  it "can recommend personnel to a different ship" do

    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    kathy = Person.new('Kathy Chan', 10)
    polly = Person.new('Polly Parker', 8)
    rover = Person.new('Rover Henriette', 1)
    sampson = Person.new('Sampson Edwards', 7)
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh.flotilla.recommend_personnel(odyssey)).to eq([polly])
  end
end
