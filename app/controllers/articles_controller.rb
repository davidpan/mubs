class ArticlesController < ApplicationController
  
  before_filter :load_blog  

  # GET /articles
  # GET /articles.xml
  def index
    @articles = @blog.articles.find_new(15)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @blog = @article.blog if @blog.nil?
    @comments = Comment.find(:all, :conditions => ['article_id = ?', @article.id] ).concat( Article.find(:all, :conditions => ['parent_id = ?', @article.id]))
    @comments.sort! do |x, y|
      x.created_at <=> y.created_at
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    @article.blog_ids << @blog.id
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { @article.parent_id.nil? ? redirect_to([@blog, @article]) : redirect_to([@blog, Article.find(@article.parent_id)]) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to([@blog, @article]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(blog_articles_url(@blog)) }
      format.xml  { head :ok }
    end
  end
  
private
   def load_blog 
     @blog = Blog.find(params[:blog_id]) if params[:blog_id]
   end 
end
