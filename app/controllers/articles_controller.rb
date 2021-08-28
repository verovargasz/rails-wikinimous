class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save

    # no need for app/views/articles/create.html.erb
    redirect_to article_path(@article)
  end

  def edit
    find_article
  end

  def update
    find_article
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def show
    find_article
  end

  def destroy
    find_article
    @article.destroy

    # no need for app/views/articles/destroy.html.erb
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
