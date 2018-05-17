users = [{name: "bobby"},{name: "sue"}, {name: "frank"}]

users.each do |user|
  User.create(user)
end

clients = [{name: "mike", user_id: User.first.id}, {name: "nick", user: User.second}, {name: "brad", user: User.third}]

clients.each do |client|
  Client.create(client)
end

projects = [{client_id: Client.first.id, name: 'Staked Leg Coffee Table', furniture_type: 'table', material: 'oak and pine', cost_to_produce: 100, price_to_client: 250, status: 'complete'},
            {client_id: Client.second.id, name: 'Modern Lounger', furniture_type: 'chair', material: 'aluminum and fabric', cost_to_produce: 800, price_to_client: 1600, status: 'in production'},
            {client_id: Client.second.id, name: 'Applebox Inspired Desk', furniture_type: 'desk', material: 'plywood and steel', cost_to_produce: 160, price_to_client: 300, status: 'estimate sent to client'}]

projects.each do |project|
  Project.create(project)
end
