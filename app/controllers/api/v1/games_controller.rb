class Api::V1::GamesController < ApiController

  def show
    find_valid_game(params[:id])
  end

  def create
    response = GameCreatorService.new(request.env["HTTP_X_API_KEY"], params[:opponent_email])
    response.run
    render json: response.game, message: response.messages
  end
end
