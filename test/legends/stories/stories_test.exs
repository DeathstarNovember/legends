defmodule Legends.StoriesTest do
  use Legends.DataCase

  alias Legends.Stories

  describe "posts" do
    alias Legends.Stories.Post

    @valid_attrs %{body: "some body", chapter: 42, description: "some description", end_date: ~D[2010-04-17], sort_order: 42, start_date: ~D[2010-04-17], title: "some title"}
    @update_attrs %{body: "some updated body", chapter: 43, description: "some updated description", end_date: ~D[2011-05-18], sort_order: 43, start_date: ~D[2011-05-18], title: "some updated title"}
    @invalid_attrs %{body: nil, chapter: nil, description: nil, end_date: nil, sort_order: nil, start_date: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stories.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Stories.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Stories.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Stories.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.chapter == 42
      assert post.description == "some description"
      assert post.end_date == ~D[2010-04-17]
      assert post.sort_order == 42
      assert post.start_date == ~D[2010-04-17]
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Stories.update_post(post, @update_attrs)
      assert post.body == "some updated body"
      assert post.chapter == 43
      assert post.description == "some updated description"
      assert post.end_date == ~D[2011-05-18]
      assert post.sort_order == 43
      assert post.start_date == ~D[2011-05-18]
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_post(post, @invalid_attrs)
      assert post == Stories.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Stories.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Stories.change_post(post)
    end
  end
end
