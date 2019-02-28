defmodule Wiki.Repo.Migrations.AddBornToAndAddDiedToCharacter do
  use Ecto.Migration

  def change do
    alter table(:characters) do
      add :born, :string
      add :died, :string
    end
  end
end
