
#the class name must be the camelcased version of the filename
class CreateWordsTable <  ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string :word
      t.text :text
    end
  end
 
  def down
    drop_table :words
  end
end
