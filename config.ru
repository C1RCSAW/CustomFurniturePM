#this file is the boot up for the application per Rack convention

require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ProjectsController
use MakersController
use ClientsController
run ApplicationController
