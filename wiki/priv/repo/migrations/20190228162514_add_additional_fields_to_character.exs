defmodule Wiki.Repo.Migrations.AddAdditionalFieldsToCharacter do
  use Ecto.Migration

  def change do
    alter table(:characters) do
      add :characteristics, :string
      add :backstory, :text
      add :abilities, :text
    end
  end
end
