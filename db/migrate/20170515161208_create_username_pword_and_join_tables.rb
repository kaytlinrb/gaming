class CreateUsernamePwordAndJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:passwords) do |t|
      t.column(:password, :string)

      t.timestamps()
    end

    create_table(:usernames) do |t|
      t.column(:username, :string)

      t.timestamps()
    end
    create_table(:profiles) do |t|
      t.column(:username_id, :integer)
      t.column(:password_id, :integer)
      t.column(:profile_name, :string)

      t.timestamps()
    end
  end
end
