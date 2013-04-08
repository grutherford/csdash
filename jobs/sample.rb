current_valuation = 0
current_target = 0
current_orders = 0
current_quotes = 0

SCHEDULER.every '2s' do
  last_valuation = current_valuation
  last_target     = current_target
  last_quotes	 = current_quotes
  last_orders	 = current_orders
  current_valuation = rand(100)
  current_target     = rand(200000)
  
  if last_orders == 10
  	current_orders = 0
  else
  	current_orders = last_orders+1
  end

  if last_quotes == 100
  	current_quotes = 0
  else 
	current_quotes = last_quotes+5
  end

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('target', { current: current_target, last: last_target })
  send_event('quotes',   { value: current_quotes })
  send_event('orders',   { value: current_orders })
end