module Api
  class MakesController < Api::BaseController

    private

    def make_params
      puts "------------------- params.inspect -------------------"
      puts params.inspect
      params.require(:make).permit(:name)
    end

  end
end