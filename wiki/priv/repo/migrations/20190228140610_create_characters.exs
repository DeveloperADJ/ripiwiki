defmodule Wiki.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :age, :string
      add :content, :string

      timestamps()
    end

  end
end
