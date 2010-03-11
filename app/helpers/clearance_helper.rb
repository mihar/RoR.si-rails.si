module ClearanceHelper
  def authentication_links
    if signed_in?
      signed_in_links
    else
      signed_out_links
    end
  end

  def signed_out_links
    [link_to("Registracija", sign_up_path),
     link_to("Prijava", sign_in_path)]
  end

  def signed_in_links
    [link_to("Nastavitve", edit_user_path(current_user)),
     link_to("Odjava",   sign_out_path)]
  end
end
