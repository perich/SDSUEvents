class AddCachedVotesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :cached_votes_total, :integer, :default => 0
    add_column :events, :cached_votes_score, :integer, :default => 0
    add_column :events, :cached_votes_up, :integer, :default => 0
    add_column :events, :cached_votes_down, :integer, :default => 0
    add_column :events, :cached_weighted_score, :integer, :default => 0
    add_column :events, :cached_weighted_total, :integer, :default => 0
    add_column :events, :cached_weighted_average, :float, :default => 0.0
    add_index  :events, :cached_votes_total
    add_index  :events, :cached_votes_score
    add_index  :events, :cached_votes_up
    add_index  :events, :cached_votes_down
    add_index  :events, :cached_weighted_score
    add_index  :events, :cached_weighted_total
    add_index  :events, :cached_weighted_average

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :events, :cached_votes_total
    remove_column :events, :cached_votes_score
    remove_column :events, :cached_votes_up
    remove_column :events, :cached_votes_down
    remove_column :events, :cached_weighted_score
    remove_column :events, :cached_weighted_total
    remove_column :events, :cached_weighted_average
  end
end