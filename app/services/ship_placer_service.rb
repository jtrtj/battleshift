class ShipPlacerService
  attr_reader :game
  def initialize(params, user_api_key)
    @game_id      = params[:game_id]
    @ship_size    = params[:ship_size]
    @start_space  = params[:start_space]
    @end_space    = params[:end_space]
    @user_api_key = user_api_key
    @messages     = []
    @game         = blank_game
  end

  def run
    ship_placer.run
    if @ship_size == 3
      @messages << "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."
    else
      @messages << "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
    end
  end

  def messages
    @messages.join(" ")
  end

  attr_reader :game_id,
              :ship_size,
              :start_space,
              :end_space,
              :user_api_key,
              :board

  def set_board
    # binding.pry
    if find_user.id == find_game.player_1.id
      @board = @game.player_1_board
    else
      @board = @game.player_2_board
    end
  end

  def ship
    Ship.new(@ship_size)
  end

  def ship_placer
    ShipPlacer.new(set_board, ship, @start_space, @end_space)
  end

  def find_user
    User.find_by(user_token: @user_api_key)
  end

  def find_game
    @game = Game.find(@game_id)
  end

  def blank_game
    Game.new(player_1_id: nil,
      player_2_id: nil,
      player_1_board: Board.new(1),
      player_2_board: Board.new(1))
  end
end
