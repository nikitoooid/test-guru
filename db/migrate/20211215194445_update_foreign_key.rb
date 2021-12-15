class UpdateForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :test_passages, :questions, column: "current_question_id"

    add_foreign_key :test_passages, :questions, column: "current_question_id", on_delete: :cascade
  end
end
