class AddAccounts < ActiveRecord::Migration[7.0]
  class << self
    def up
      create_table :accounts do |t|
        t.column :name, :string, :null => true
        t.column :lastname, :string, :null => true
        t.column :email, :string, :null => true
        t.column :created_at, :datetime, null: false
        t.column :updated_at, :datetime, null: false
        t.column :blocked, :boolean, default: false
      end
    end

    def down
      drop_table :accounts
    end
  end
end