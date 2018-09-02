class Api::V1::Games::ShotsController < ApiController
  before_action :game_over?, :authorized?, :current_users_turn?

  def create
    shot_creator = ShotCreatorService.new(params[:game_id])
    shot_creator.run
    render json: shot_creator.game, message: shot_creator.messages

    game = Game.find(params[:game_id])

    turn_processor = TurnProcessor.new(game, params[:shot][:target])
    turn_processor.run!

    if turn_processor.message == "Invalid coordinates."
      render json: game, message: turn_processor.message, status: 400
      game.save!
    else
      render json: game, message: turn_processor.message
      game.turn_switcher(current_user)
      game.save!
    end

  end
end
