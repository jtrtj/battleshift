class ShotCreatorService
  def initialize(game_id)
    @game_id = game_id
  end

  def find_game
    Game.find(@game_id)
  end
end