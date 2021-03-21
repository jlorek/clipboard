defmodule Clipboard.BoardTest do
  use Clipboard.DataCase

  alias Clipboard.Board

  describe "topics" do
    alias Clipboard.Board.Topic

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Board.create_topic()

      topic
    end

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Board.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Board.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      assert {:ok, %Topic{} = topic} = Board.create_topic(@valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{} = topic} = Board.update_topic(topic, @update_attrs)
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_topic(topic, @invalid_attrs)
      assert topic == Board.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Board.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Board.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Board.change_topic(topic)
    end
  end

  describe "posts" do
    alias Clipboard.Board.Post

    @valid_attrs %{data: "some data", filename: "some filename", mimetype: "some mimetype"}
    @update_attrs %{data: "some updated data", filename: "some updated filename", mimetype: "some updated mimetype"}
    @invalid_attrs %{data: nil, filename: nil, mimetype: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Board.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Board.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Board.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Board.create_post(@valid_attrs)
      assert post.data == "some data"
      assert post.filename == "some filename"
      assert post.mimetype == "some mimetype"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Board.update_post(post, @update_attrs)
      assert post.data == "some updated data"
      assert post.filename == "some updated filename"
      assert post.mimetype == "some updated mimetype"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_post(post, @invalid_attrs)
      assert post == Board.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Board.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Board.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Board.change_post(post)
    end
  end
end
