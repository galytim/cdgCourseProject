module Visible   extend ActiveSupport::Concern
    def author?(cur_user)
      cur_user == self.user
    end
end