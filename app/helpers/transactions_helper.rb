module TransactionsHelper
  def get_distance_search(transaction, local)
    distance = transaction.distance_to(local)
    if distance < 1
      (distance*1000).to_i.to_s + " M"
    else
      distance.round(2).to_s + " Km"
    end
  end

  def get_distance_search(transaction, local)
    distance = transaction.distance_to(local)
    if distance < 1
      return (distance*1000).to_i.to_s + " M"
    else
      return distance.round(2).to_s + " Km"
    end
  end
end
