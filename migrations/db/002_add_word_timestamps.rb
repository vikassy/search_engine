
#the class name must be the camelcased version of the filename
class AddWordTimestamps <  ActiveRecord::Migration
  def up
    change_table :words do |t|
      t.timestamps
    end
  end
 
  #def down
  
  #end
end
