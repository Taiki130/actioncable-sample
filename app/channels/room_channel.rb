class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "root_channel"
  end

  def unsubscribed
  end

  def speak
    ActionCable.server.broadcast(
      "root_channel", { message: data["message"] }
    )
  end
end
