#the class name must be the camelcased version of the filename
class CreateFilterTable <  ActiveRecord::Migration
  def up
    create_table :filters do |t|
      t.string :word
    end
  end

  def down
    drop_table :filters
  end
end
