defmodule Wiki.Repo.Migrations.ChangeCharacterContentToText do
  use Ecto.Migration

  def change do
    alter table(:characters) do
      modify :content, :text
    end
  end
end
