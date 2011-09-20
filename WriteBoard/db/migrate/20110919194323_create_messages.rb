class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :author
      t.references :parent
      t.string     :content, :limit => 150
      t.timestamps
    end
    add_index :messages, :author_id
    add_index :messages, :parent_id
  end

  def self.down
    drop_table :messages
  end
end
