# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
projects = [{name: 'Staked Leg Coffee Table', furniture_type: 'table', material: 'oak and pine', cost_to_produce: 100, price_to_client: 250, status: 'complete'},
            {name: 'Modern Lounger', furniture_type: 'chair', material: 'aluminum and fabric', cost_to_produce: 800, price_to_client: 1600, status: 'in production'},
            {name: 'Applebox Inspired Desk', furniture_type: 'desk', material: 'plywood and steel', cost_to_produce: 160, price_to_client: 300, status: 'estimate sent to client'}]

projects.each do |project|
  Project.create(project)
end
