defmodule Wiki.Repo.Migrations.AddImageWebUrlToCharacter do
  use Ecto.Migration

  def change do
    alter table(:characters) do
      add :image_web_url, :string
    end
  end
end
