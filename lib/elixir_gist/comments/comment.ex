defmodule ElixirGist.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comment" do
    field :markup_text, :string
    # field :user_id, :binary_id
    # field :gist_id, :binary_id
    belongs_to :user, ElixirGist.Accounts.User
    belongs_to :gist, ElixirGist.Gists.Gist

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :gist_id])
    |> validate_required([:markup_text, :user_id, :gist_id])
  end
end
