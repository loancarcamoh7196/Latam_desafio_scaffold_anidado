class SongsController < ApplicationController
    def create
        @song = Song.new(song_params)
        @song[:playlist_id] = params[:playlist_id]
        @song.save
        redirect_to playlist_path(params[:playlist_id]), notice: 'La canción se ha creado con éxito!'
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to playlist_path(params[:playlist_id]),  notice: 'La canción se ha eliminado con éxito!'
        end
    
    
    private
    def song_params
        params.require(:song).permit(:artist, :name, :playlist_id)
    end
    
end
