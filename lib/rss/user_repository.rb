module Rss
  module UserRepository
    Users = [
      User.new('admin', 'admin', 'admin'),
      User.new('wli', 'William Li', 'users')
    ]


    def all_users
      return Users
    end
  end
end