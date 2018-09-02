class Api::V1::GamesController < ApiController

  def show
    find_valid_game(params[:id])
  end

  def create
    game_creator = GameCreatorService.new(request.env["HTTP_X_API_KEY"], params[:opponent_email])
    game_creator.run
    render json: game_creator.game, message: game_creator.messages
  end
end
