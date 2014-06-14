json.array!(@sound_clips) do |sound_clip|
  json.extract! sound_clip, :id, :title, :description, :attachment
  json.url sound_clip_url(sound_clip, format: :json)
end
