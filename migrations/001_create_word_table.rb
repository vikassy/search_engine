
#the class name must be the camelcased version of the filename
class CreateWordTable <  ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.integer :wordlength
    end
  end
 
  def down
    drop_table :words
  end
end
