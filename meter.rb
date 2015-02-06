require 'active_record'

DATABASE = "meter"

# cleanup since we might run this file (application) several times while building
`rm #{DATABASE}.db`

# setup the database connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database =>  "#{DATABASE}.db"
)


# design the table schema
ActiveRecord::Migration.create_table :questions do |t|
  t.string :text
  t.integer :frequency

  t.timestamps
end

# the placeholder in the line below just lets Active Record Migrator work without hanging
ActiveRecord::Migrator.up 'placeholder'
