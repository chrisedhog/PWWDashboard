class SessionsController < Devise::SessionsController
    skip_before_filter :profile_set
end