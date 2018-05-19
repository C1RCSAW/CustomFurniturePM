users = [{name: "bobby", username: "bobby84"},{name: "sue", username: "souix42"}, {name: "frank", username: "frankfurter01"}]

users.each do |user|
  User.create(user)
end

clients = [{name: "mike", user_id: User.first.id}, {name: "nick", user: User.second}, {name: "brad", user: User.third}]

clients.each do |client|
  Client.create(client)
end

projects = [{client_id: Client.first.id, name: 'Staked Leg Coffee Table', furniture_type: 'table', material: 'oak and pine', price_to_client: 250, status: 'complete'},
            {client_id: Client.second.id, name: 'Modern Lounger', furniture_type: 'chair', material: 'aluminum and fabric', price_to_client: 1600, status: 'in production'},
            {client_id: Client.second.id, name: 'Applebox Inspired Desk', furniture_type: 'desk', material: 'plywood and steel', price_to_client: 400, status: 'estimate sent to client'}]

projects.each do |project|
  Project.create(project)
end

costs = [{project_id: Project.first.id, description: 'materials', amount: 50},
         {project_id: Project.first.id, description: 'labor', amount: 100},
         {project_id: Project.second.id, description: 'materials', amount: 200},
         {project_id: Project.second.id, description: 'labor', amount: 600},
         {project_id: Project.third.id, description: 'materials', amount: 100},
         {project_id: Project.third.id, description: 'labor', amount: 100}]

costs.each do |cost|
  Cost.create(cost)
end
