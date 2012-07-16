# encoding: utf-8
class BenchmarkFilter
  def self.filter(controller)
    timer = Time.now
    Rails.logger.debug "---#{controller.controller_name} #{controller.action_name}"
    yield                 # For Action
    elapsed_time = Time.now - timer
    Rails.logger.debug "---#{controller.controller_name} #{controller.action_name} finished in %0.3s" % elapsed_time
  end

end
