module UsersHelper
  def params_for_column_ordering(column)
    column = column.to_sym
    current_ordering = params.fetch(:order, {}).fetch(column, {})
    new_ordering = ['asc', {}].include?(current_ordering) ? 'desc' : 'asc'
    return { order: {column => new_ordering} }
  end
end
