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

  describe "locations" do
    alias Wiki.Topics.Location

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Topics.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Topics.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Topics.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Topics.create_location(@valid_attrs)
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topics.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Topics.update_location(location, @update_attrs)
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Topics.update_location(location, @invalid_attrs)
      assert location == Topics.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Topics.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Topics.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Topics.change_location(location)
    end
  end
end
