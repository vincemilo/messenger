class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message"
  end

  def unsubscribed
    def receive(data)
      data['user'] = current_user
      ActionCable.server.broadcast('message', data)
    end
  end
end
