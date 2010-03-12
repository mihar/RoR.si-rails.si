module RestrictToOwner
  def self.included(base)
    base.class_eval {
      before_filter :restrict_data_alteration, :only => [:edit, :update, :destroy]
      
      private
      
      def restrict_data_alteration
        unless current_user.admin?
          unless current_user.send("owns_#{controller_name.singularize}?", resource)
            flash[:error] = "Spreminja lahko samo lastnik."
            redirect_to root_path
          end
        end
      end
    }
  end
end