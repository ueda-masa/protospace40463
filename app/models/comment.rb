class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :user

  validates :text, presence: true

  def change
    create_table :messages do |t|
      t.text  :content, null: false
      t.references :prototype, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
