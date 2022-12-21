class ActionIntentsController < ApplicationController
  # first we need to replace the standard actions on the page with
  # the updated direction actions.
  #
  # i.e. if a player presses 'd' then we will replace the keybindings
  # partial with one that includes LKJ but pressing 'l' will be the 'dl' (delete right)
  # action
  def create
    @movement = params[:player_action]
    @avatar = GamePieces::Player.find(params[:player_id])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end
end
