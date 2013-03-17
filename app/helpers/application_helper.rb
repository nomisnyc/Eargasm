module ApplicationHelper
  def intellinav
    if @auth.present?
      link_to(@auth.name, login_path, :method => :delete)

    else
      link_to('login', login_path, :id => 'logbutton', :remote => true)
    end
  end
end
