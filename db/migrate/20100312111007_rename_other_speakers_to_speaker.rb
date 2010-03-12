class RenameOtherSpeakersToSpeaker < ActiveRecord::Migration
  def self.up
    rename_column :presentations, "other_speakers", "speaker"
  end

  def self.down
    rename_column :presentations, "speaker", "other_speakers"
  end
end
