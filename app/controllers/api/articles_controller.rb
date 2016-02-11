module Api
  class ArticlesController < Api::BaseController

    private

    def article_params
      params.require(:article).permit(:title, :author)
    end

  end
end