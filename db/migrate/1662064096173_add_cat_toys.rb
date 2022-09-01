class AddCatToys < ActiveRecord::Migration[7.0]
  class << self
    def up
      create_table :cat_toys do |t|
        t.column :title, :string, :null => false
        t.column :account_id, :int, :null => true
        t.column :options, :string, :null => true
        t.column :created_at, :datetime, null: false
        t.column :updated_at, :datetime, null: false
      end
    end

    def down
      drop_table :cat_toys
    end
  end
end