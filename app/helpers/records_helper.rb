module RecordsHelper

  def sort_td_class_helper(param)
    result = 'sortup' if params[:sort] == param
    result = 'sortdown' if params[:sort] == param + "_reverse"
    return result
  end

  def sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    #return "<a href=""/records/?sort=" + key + ">" +  
    link_to text, params.merge({:sort => key, :page => nil}) 
  end


end
