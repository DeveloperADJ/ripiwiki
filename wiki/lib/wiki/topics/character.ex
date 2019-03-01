defmodule Wiki.Topics.Character do
  use Ecto.Schema
  import Ecto.Changeset


  schema "characters" do
    field :age, :string
    field :content, :string
    field :name, :string
    field :born, :string
    field :died, :string
    field :characteristics, :string
    field :backstory, :string
    field :abilities, :string
    field :image_web_url, :string

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :age, :content, :born, :died, :characteristics, :backstory, :abilities, :image_web_url])
    |> validate_required([:name, :content])
  end
end
