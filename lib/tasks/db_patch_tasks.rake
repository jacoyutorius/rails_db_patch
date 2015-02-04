require "active_record"
require "db_patch/migration"
require "db_patch/patch_version"


namespace :db do
  namespace :patch do

  	desc "initialize database"
    task :init => :environment do
    	DbPatch::Migration::CreatePatchVersions.new.up
    	Dir.mkdir patch_root
    end


    desc "clear database"
    task :clear => :environment do 
    	DbPatch::Migration::CreatePatchVersions.down
    	FileUtils.rm_rf patch_root
    end


    desc "create new patch file"
    task :new => :environment do
    	patch_name = "#{patch_root}/#{Time.now.strftime("%Y%m%d%H%M%S")}.rb"
    	File.open(patch_name, "w").close
    	p patch_name
    end


    desc "execute path"
    task :execute => :environment do 
    	patches = Dir.glob("#{patch_root}/*.rb")
    	patches.each do |patch|

    		basename = File.basename(patch, ".rb")
        next unless DbPatch::PatchVersion.find_by(version: basename).nil?
    		
        # execute script
    		require patch

        DbPatch::PatchVersion.create!(
          version: basename
          )

        p "#{basename}.rb executed."
    	end
    end


    def patch_root
    	"#{Rails.root}/db/patch"
    end

  end
end
