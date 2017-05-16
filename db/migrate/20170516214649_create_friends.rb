class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table(:friends) do |t|
      t.column(:username, :string)

      t.timestamps()
    end
    create_table(:friends_profiles) do |t|
      t.column(:friend_id, :integer)
      t.column(:profile_id, :integer)

      t.timestamps()
    end
  end
end
