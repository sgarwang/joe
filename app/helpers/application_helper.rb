module ApplicationHelper
  
  def gravatar_url(email)
    debugger
    gravatar_email = Digest::MD5.hexdigest(email.downcase)
    return "http://www.gravatar.com/avatar/#{gravatar_email}?s=48"
  end
    
end
