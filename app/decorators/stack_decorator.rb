class StackDecorator < Cherry::Decorator
  def name(account, project)
    return object.title unless object.title.blank?
    return I18n.t('projects.users.default') if account.present? && object == account.stack_core.default
    return "#{project.name}'s Stack" unless project.nil?
    I18n.t('unnamed')
  end
end
