class HealthController < ApplicationController

  def health
    render json: {message: "OK"}, status: :ok
  end

end
