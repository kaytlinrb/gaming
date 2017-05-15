class CreateVideogamesTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:videogames) do |t|
      t.column(:game_name, :string)

      t.timestamps()
    end
    create_table(:opinions) do |t|
      t.column(:profile_id, :integer)
      t.column(:videogame_id, :integer)
      t.column(:post, :string)
      t.column(:tag, :string)

      t.timestamps()
    end
  end
end
