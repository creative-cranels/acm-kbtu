class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.json
  # def index
  #   @nodes = Node.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @nodes }
  #   end
  # end

  # GET /nodes/1
  # GET /nodes/1.json
  # def show
  #   @node = Node.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @node }
  #   end
  # end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @node = Node.new
    authorize! :edit, @node

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.all(:path => params[:id])[0]
    authorize! :edit, @node
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])
    authorize! :edit, @node

    respond_to do |format|
      if @node.save
        format.html { redirect_to list_path, notice: 'Node was successfully created.' }
        #format.json { render json: @node, status: :created, location: @node }
      else
        format.html { render action: "new" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    @node = Node.find(params[:id])
    authorize! :edit, @node

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to list_path, notice: 'Node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node = Node.find(params[:id])
    authorize! :edit, @node
    @node.destroy

    respond_to do |format|
      format.html { redirect_to list_path }
      format.json { head :no_content }
    end
  end
end
