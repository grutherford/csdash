buzzwords = [
	'LQ065T5AR05','610592','CDO-225','ST7590T','611395','23_716-50-0-222/003_-Y','T491D336K025ZT','TCO-5861G-16.398MHZ','MDD019RD13','RLD65PZB5','S29C94','XC4VLX60-10FFG668C','AT-240160BFIEW-72-A(T)(R)','ST5451DTR','BMR 603 1204/1','LXCL-PWF3','STM32F103VET6','S3C4510B01QER0','HCPL-7840-500E','GVN54'] 
buzzword_counts = Hash.new({ value: 0 })

SCHEDULER.every '2s' do
  random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }
  
  send_event('hotparts', { items: buzzword_counts.values })
end