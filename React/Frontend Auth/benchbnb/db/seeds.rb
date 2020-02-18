Bench.delete_all
User.delete_all

b1 = Bench.create!(
  description: 'Base Bench',
  lat: 40.718708,
  lng: -74.039886,
  seating: 1
)

b2 = Bench.create!(
  description: 'Madison Sq. Park Bench',
  lat: 40.741724,
  lng: -73.988477,
  seating: 20
)

b3 = Bench.create!(
  description: 'Downtown Froyo Bench',
  lat: 40.720167,
  lng: -74.043035,
  seating: 2
)

b4 = Bench.create!(
  description: 'Ani Bench',
  lat: 40.722085,
  lng: -74.046842,
  seating: 3
)

u1 = User.create!(
  username: 'slamdunk',
  password: 'password'
)

u2 = User.create!(
  username: 'mttrms',
  password: 'password'
)
