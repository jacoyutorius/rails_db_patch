module DbPatch
	module Migration

		class CreatePatchVersions < ActiveRecord::Migration
			def self.up
				create_table :patch_versions do |t|
					t.string :version
				end

				add_index :patch_versions, :version, :unique => true
			end

			def self.down
				drop_table :patch_versions
			end
		end
	end
	
end