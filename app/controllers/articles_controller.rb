class ArticlesController < ApplicationController
	before_action :set_article, only:[:show,:edit,:update,:destroy]

	def show
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		#render plain: params[:article]
		@article = Article.new(article_params)
		if @article.save
			#render plain: @article.errors.full_messages
			#redirecting to show action with id
			#redirect_to article_path(@article)
			#shortened article_path
			flash[:notice] = "article was successfully created"
			redirect_to @article #redirects to show action
		else
			render 'new'
		end
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "article updated successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])	
	end

	def article_params
		params.require(:article).permit(:title,:description)
	end
end