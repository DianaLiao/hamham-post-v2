class WelcomeController < ApplicationController


  def home
    @user = current_user
    @unseen_boards = []

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
end
