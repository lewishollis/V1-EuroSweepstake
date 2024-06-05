class AddAccessibleEventSummaryToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :accessible_event_summary, :string
  end
end
