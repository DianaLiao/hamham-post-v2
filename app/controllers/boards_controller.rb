class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards or /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1 or /boards/1.json
  def show

    @messages = @board.messages
    @new_msg = Message.new

    #go through boards's messages
    @messages.each do |message|

      #find or create seen message
      SeenMessage.find_or_create_by(message_id: message.id, user_id: session[:user_id])
    end
    a = params.to_unsafe_hash
    if(a[:msg])
      @first_unread = Message.find(a[:msg])
      render board_path(@board, anchor: "look")
    end

  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards or /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1 or /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: "Board was successfully updated." }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1 or /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def user_convo
    # accept params to build a new board
    convo_params = params.require(:board).permit(:other_user_id, :user_id)
    # convert user ids in params to integers 
    convo_ids = convo_params.values.map{|id| id.to_i}

    # attempt to find a personal board with the two users as members
    convo = Board.all.find do |board|
      board.member_ids.sort == convo_ids.sort && board.personal == true
    end

    # if there is a convo, go there! if not, make one
    if convo
      redirect_to board_path(convo)
    else
      # create board
      new_board = Board.create(name:"Chat between #{User.find(convo_ids[0]).first_name} and #{User.find(convo_ids[1]).first_name}", desc: "Personal chat", personal: true, public: false, listed: false)

      # create memberships
      new_board.memberships.build(user_id:convo_ids[0], admin: true).save
      new_board.memberships.build(user_id:convo_ids[1], admin: true).save
      
      redirect_to board_path(new_board)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name, :desc, :listed, :public)
    end
end
