module UsersHelper

  def id_sort
    id_order = params.fetch(:order, {}).fetch(:id, {})
    return ['asc', {}].include?(id_order) ? 'desc' : 'asc'
  end

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
