class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(Customer)
           public_customers_show_path
        elsif resource.is_a?(Admin)
           admin_root_path
        else
           member_root_path(resource)
        end
    end
    
    def after_sign_out_path_for(resource)
        if resource.is_a?(Admin)
           new_admin_session_path
        else
           public_root_path
        end
    end
end