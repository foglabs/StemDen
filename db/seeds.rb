# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



samples = Sample.create([
  {name: 'Asamp', category: 'Agenre', user_id: 1, filepath: 'good'},
  {name: 'Sumpin', category: 'Agenre', user_id: 1, filepath: 'good'},
  {name: 'Yooooo', category: 'Agenre2', user_id: 1, filepath: 'ooooo'}


  ])
