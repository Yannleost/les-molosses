module DogsHelper
  def find_dog_post_conversation_path
    conversations = get_conversations
    if conversations.present?
      dog_conversation_messages_path(@dog, conversations.last, format: :json)
    else
      dog_conversations_path(@dog, format: :json)
    end.to_json
  end

  def find_messages_index_path
    conversations = get_conversations
    if conversations.present?
      dog_conversation_messages_path(@dog, conversations.last, format: :json)
    else
      nil
    end.to_json
  end

  private

  def get_conversations
    Conversation.of_dog(@dog).of_sender(current_user)
  end
end
