class UpdateGistsQuestionsForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :gists, :questions

    add_foreign_key :gists, :questions, on_delete: :cascade
  end
end
