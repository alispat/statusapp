# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(site: 'Your status page', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.', url: 'http://foo.bar.com')

Situation.destroy_all
Situation.create(name: 'Operacional', color: '#71bf60', icon: 'fa fa-check-circle')
Situation.create(name: 'Problemas de performance', color: '#3498db', icon: 'fa fa-dashboard')
Situation.create(name: 'Indisponibilidade parcial', color: '#ff8800', icon: 'fa fa-low-vision')
Situation.create(name: 'Indisponibilidade total', color: '#ff6f6f', icon: 'fa fa-warning')
Situation.create(name: 'Manutenção programada', color: '#888', icon: 'fa fa-wrench', maintenance: true)