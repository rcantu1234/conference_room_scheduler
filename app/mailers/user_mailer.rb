class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.new_user.subject
  #
  def new_user
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.new_post.subject
  #
  def new_post
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.new_comment.subject
  #
  def new_comment(comment)
    @comment = comment

    mail to: comment.post_author_email, subject: 'New Comment On Post'
  end

  def new_meeting(meeting)
    @meeting = meeting

    mail to: meeting.user.email, subject: 'New Meeting'
  end
end
