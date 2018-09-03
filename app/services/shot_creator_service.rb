class ShotCreatorService
  def initialize(game_id, target)
    @game_id = game_id
    @target = target
  end

  def create_turn_process
    TurnProcessor.new(find_game, @target)
  end

  def find_game
    Game.find(@game_id)
  end
end