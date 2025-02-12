module ApplicationCable
  class Connection < ActionCable::Connection::Base

    include SessionsHelper

    identified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    def find_verified_user
      if logged_in?
        current_user
      else
        reject_unauthorized_connectioned
      end
    end
  end
end
