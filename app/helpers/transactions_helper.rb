module TransactionsHelper
  def distance_view(transaction, local)
    distance = transaction.distance_to(@tran)
    if distance < 1
      return (distance*1000).to_i.to_s + " M"
    else
      return distance.round(2).to_s + " Km"
    end
  end
end
