# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_post
  def new_post
    UserMailer.new_post
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_comment
  def new_comment
    UserMailer.new_comment
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_user
  def new_user
    UserMailer.new_user
  end

end
