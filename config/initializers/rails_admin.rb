RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path, alert: 'You do not have permission to access this area.' unless (current_user.has_role? :admin) || (current_user.has_role? :super_admin)
  end

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
