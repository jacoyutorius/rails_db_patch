require "db_patch"
require "rails"

module DbPatch
  class Railtie < Rails::Railtie
    railtie_name :db_patch

    rake_tasks do
      load "tasks/db_patch_tasks.rake"
    end
  end
end