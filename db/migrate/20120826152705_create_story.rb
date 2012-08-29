class CreateStory < ActiveRecord::Migration
  def change
    create_table :story do |t|

      t.timestamps
    end
  end
end
