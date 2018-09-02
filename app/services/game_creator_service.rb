class GameCreatorService
  attr_reader :user_api_key, :opponent_email, :game

  def initialize(user_api_key, opponent_email)
    @user_api_key = user_api_key
    @opponent_email = opponent_email
    @game = blank_game
    @messages = []
  end

  def run
    create_game
  end

  def messages
    @messages.join(" ")
  end

  private
  
  def find_user
    User.find_by(user_token: @user_api_key)
  end

  def find_opponent
    User.find_by(email: @opponent_email)
  end

  def make_boards
    { player_1_board: Board.new(4), player_2_board: Board.new(4) }
  end

  def create_game
    if find_opponent.nil?
      @messages << "Game was not created. Check your opponent credentials."
    else
      @game = Game.create!(player_1_id: find_user.id,
                          player_2_id: find_opponent.id,
                          player_1_board: make_boards[:player_1_board],
                          player_2_board: make_boards[:player_2_board])
      @messages << "New Game Created."
    end
  end

  def blank_game
    Game.new(player_1_id: nil, 
             player_2_id: nil, 
             player_1_board: Board.new(1), 
             player_2_board: Board.new(1))
  end
end