class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json

  def after_index
    @main_pages = Page.all(:parent => 'main_page')
    @children_pages = Page.all(:parent => @page.title.downcase)
  end


  def list
    @pages = Page.all

    authorize! :read, @pages

    #if can? current_user, @pages
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pages }
      end
    #else
      #redirect_to posts_path
    #end
  end

  def index
    @page = Page.all(:path => '1')[0]
    authorize! :read, @page

    after_index
  end

  def controll
    @page = Page.all(:path => params[:path])[0]
    after_index
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @main_pages = Page.all(:parent => 'main_page')

    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    authorize! :new, @page

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    authorize! :create, @page

    @page.parent.downcase!

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
    authorize! :update, @page

    page_update = params[:page]

    page_update[:parent].downcase!

    respond_to do |format|
      if @page.update_attributes(page_update)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])

    authorize! :destroy, @page

    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
