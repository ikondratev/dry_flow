class AddReports < ActiveRecord::Migration[7.0]
  class << self
    def up
      create_table :reports do |t|
        t.column :account_id, :int, :null => false
        t.column :cat_toy_is, :int, :null => false
        t.column :result, :string, :null => true
        t.column :comment, :string, :null => true
        t.column :created_at, :datetime, null: false
        t.column :updated_at, :datetime, null: false
      end
    end

    def down
      drop_table :reports
    end
  end
end