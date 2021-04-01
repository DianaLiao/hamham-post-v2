class WelcomeController < ApplicationController


  def home
    @user = current_user
    @unseen_boards = []

    if @user
      #make a list of boards with unread messages
      @user.boards.each do |board|

        board.messages.each do |message|

          #if we find a message that hasn't been viewed, add that board to the list
          msg = SeenMessage.find_by(message_id: message.id, user_id: @user.id)
          unless msg
            @unseen_boards.push(board)
            break
          end

        end
      end
    end
    @unseen_boards.uniq!
  end

  def set_marquee
    byebug
    session[:marquee] = params[]
  end

end
