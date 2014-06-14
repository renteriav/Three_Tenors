class SoundClipsController < ApplicationController
  before_action :set_sound_clip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  skip_before_action :authenticate_admin!, only: [:playlist]

  def index
    @sound_clips = SoundClip.all
  end

  def show
  end

  def new
    @sound_clip = SoundClip.new
  end

  def edit
  end

  def create
    @sound_clip = SoundClip.new(sound_clip_params)

    respond_to do |format|
      if @sound_clip.save
        format.html { redirect_to @sound_clip, notice: 'Sound clip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sound_clip }
      else
        format.html { render action: 'new' }
        format.json { render json: @sound_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sound_clip.update(sound_clip_params)
        format.html { redirect_to @sound_clip, notice: 'Sound clip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sound_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sound_clip.destroy
    respond_to do |format|
      format.html { redirect_to sound_clips_url }
      format.json { head :no_content }
    end
  end
  
  def playlist
    @sound_clips = SoundClip.all.order(title: :asc)
    @playlist = Array.new
    if @sound_clips.any?
      @sound_clips.each do |sound_clip|
        @clip_options = Hash.new

        @clip_options[:title] = sound_clip.title
        @clip_options[:artist] = sound_clip.description
        @clip_options[:mp3] = sound_clip.attachment.to_s
        
        @playlist.push(@clip_options)
      end
    end
    gon.playlist = @playlist
  end

  private
    
    def set_sound_clip
      @sound_clip = SoundClip.find(params[:id])
    end

    def sound_clip_params
      params.require(:sound_clip).permit(:title, :description, :attachment)
    end
end
