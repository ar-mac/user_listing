module UsersHelper

  def params_for_order_column(column)
    column = column.to_sym
    current_ordering = params.fetch(:order, {}).fetch(column, {})
    new_ordering = ['asc', {}].include?(current_ordering) ? 'desc' : 'asc'
    return { order: {column => new_ordering} }
  end
end
