#the class name must be the camelcased version of the filename
class AddIndexToWordInWordTable <  ActiveRecord::Migration
  def change
    add_index :words , :word
  end
end
