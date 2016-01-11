module UsersHelper

  def first_name_sort
    first_name_order = params.fetch(:order, {}).fetch(:first_name, {})
    return ['asc', {}].include?(first_name_order) ? 'desc' : 'asc'
  end

  def last_name_sort
    last_name_order = params.fetch(:order, {}).fetch(:last_name, {})
    return ['asc', {}].include?(last_name_order) ? 'desc' : 'asc'
  end

  def email_sort
    email_order = params.fetch(:order, {}).fetch(:email, {})
    return ['asc', {}].include?(email_order) ? 'desc' : 'asc'
  end

end
