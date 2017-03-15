worker_logfile = File.open("#{Rails.root}/log/wx_logger.log", 'a')
worker_logfile.sync = true
WX_LOGGER = WorkerLogger.new(worker_logfile)