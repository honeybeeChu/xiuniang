worker_logfile = File.open("#{Rails.root}/log/membership_logger.log", 'a')
worker_logfile.sync = true
MEMBERSHIP_LOGGER = MembershipLogger.new(worker_logfile)