class ShipPlacerService

  def initialize(params, user_api_key)
    @game_id      = params[:game_id]
    @ship_size    = params[:ship_size]
    @start_space  = params[:start_space]
    @end_space    = params[:end_space]
    @user_api_key = user_api_key
  end


  private

  attr_reader :game_id,
              :ship_size,
              :start_space,
              :end_space,
              :user_api_key


end
