class AddMemberIdItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :member, foreign_key: true
  end
end
