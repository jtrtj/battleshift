class Api::V1::Games::ShipPlacementController < ApiController
  def create
    sps = ShipPlacerService.new(params, request.env["HTTP_X_API_KEY"])
    game = sps.find_game
    user = sps.find_user
    board = sps.set_board
    ship = sps.ship
    ship_placer = sps.ship_placer
    sps.run
    # game = Game.find(params[:game_id])
    # user = User.find_by(user_token: request.env["HTTP_X_API_KEY"])
    #
    # if user.id == game.player_1_id
    #   board = game.player_1_board
    # else
    #   board = game.player_2_board
    # end

    # ship = Ship.new(params["ship_size"])
    # ship_placer = ShipPlacer.new(board, ship, params[:start_space], params[:end_space])
    #
    # ship_placer.run
    game.save!
    render json: game, message: sps.messages
    # if params["ship_size"] == 3
    #   render json: game, message: game.messages
    # else
    #   render json: game, message: "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
    # end
  end
end
