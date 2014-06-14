class CreateSoundClips < ActiveRecord::Migration
  def change
    create_table :sound_clips do |t|
      t.string :title
      t.string :description
      t.string :attachment

      t.timestamps
    end
  end
end
