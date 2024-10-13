class ConfigurationController < ApplicationController
  before_action :get_player

  def edit
  end

  def update
    @player.update(update_params)
    redirect_to :lobby
  end

  private

  def get_player
    @player = current_login_credential.players.find(params[:id])
  end

  def update_params
    params.require(:player).permit(:first_name, :last_name, :player_svg)
  end
end
