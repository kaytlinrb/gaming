class CreateUsernamePwordAndJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:profiles) do |t|
      t.column(:username, :string)
      t.column(:password, :string)

      t.timestamps()
    end
  end
end
