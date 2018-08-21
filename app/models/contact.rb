class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :phone,     :validate => true
  attribute :nickname,  :captcha  => true
  
  def headers
    {
      :subject => "Portfolio Application Contact Form",
      :to => "admin@ewilkinsiii.pro",
      :from => %("#{name}" <#{email}>)
    }
  end
end