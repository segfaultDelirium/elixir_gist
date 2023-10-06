defmodule ElixirGist.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comment, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :markup_text, :text
      add :user_id, references(:user, on_delete: :delete_all, type: :binary_id)
      add :gist_id, references(:gist, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:comment, [:user_id])
    create index(:comment, [:gist_id])
  end
end
