defmodule Wiki.TopicsTest do
  use Wiki.DataCase

  alias Wiki.Topics

  describe "characters" do
    alias Wiki.Topics.Character

    @valid_attrs %{age: "some age", content: "some content", name: "some name"}
    @update_attrs %{age: "some updated age", content: "some updated content", name: "some updated name"}
    @invalid_attrs %{age: nil, content: nil, name: nil}

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Topics.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Topics.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Topics.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Topics.create_character(@valid_attrs)
      assert character.age == "some age"
      assert character.content == "some content"
      assert character.name == "some name"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topics.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, %Character{} = character} = Topics.update_character(character, @update_attrs)
      assert character.age == "some updated age"
      assert character.content == "some updated content"
      assert character.name == "some updated name"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Topics.update_character(character, @invalid_attrs)
      assert character == Topics.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Topics.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Topics.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Topics.change_character(character)
    end
  end
end
