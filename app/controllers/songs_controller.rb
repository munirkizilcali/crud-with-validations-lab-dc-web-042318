class SongsController < ApplicationController

	before_action :find_song, only: [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all
	end

	def show

	end

	def edit

	end

	def update
		@song.attributes = song_params(:title, :released, :release_year, :artist_name, :genre)
		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def destroy
		@song.destroy
		redirect_to songs_path
	end

	private

	def find_song
		@song = Song.find(params[:id])
	end

	def song_params(*args)
		params.require(:song).permit(*args)
	end
end
