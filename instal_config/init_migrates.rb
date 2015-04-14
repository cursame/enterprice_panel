ActiveRecord::Migration.create_table :users do |t|
  t.string :name
  t.string :token_user
end
ActiveRecord::Migration.create_table :check_ins do |t|
  t.string :token_user
  t.datetime :check_in
end