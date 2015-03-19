class SoundClipsController < ApplicationController
  before_action :set_sound_clip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  skip_before_action :authenticate_admin!, only: [:playlist]
  before_filter :check_for_mobile
  layout "administration", only: [:show, :new, :edit, :update, :create, :destroy, :index]

  def index
    @sound_clips = SoundClip.all
    respond_to do |format|
      format.html
      format.json {
        render :json => @sound_clips.collect { |s| s.to_jq_upload }.to_json
      }
    end
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
      
      if @sound_clip.save
        flash[:notice] = 'Sound clip successfully uploaded.'
            respond_to do |format|
              format.html { redirect_to sound_clips_path}
              format.json {
                render :json => {files:[@sound_clip.to_jq_upload]},status: :created, location: @sound_clip}
                
            end
      else
            render :json => [{:error => "custom_failure"}], :status => 304
      end
      
    #  if @sound_clip.save
     #   format.html { redirect_to @sound_clip, notice: 'Sound clip was successfully created.' }
     #   format.json { render :json => [@sound_clip.to_jq_upload].to_json  }
    #  else
    #    format.html { render action: 'new' }
     #   format.json { render json: @sound_clip.errors, status: :unprocessable_entity }
     # end
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
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    
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
