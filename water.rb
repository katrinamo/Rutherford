# A water tracker is an object that takes commands
# it has a timer


class WaterTracker

  def initialize()
    # "@" means this variable is an INSTANCE variable. Descriptions:
    #   @start_time: start time for an instance of WaterTracker
    #   @remind_time: the time the user will be reminded to drink water
    #                 caluclated by adding seconds to @start_time
    @start_time = Time.now
    @remind_time = @start_time + 10
    @thread_id = nil
  end

  def water(command)

    if command == "start"
      puts "WaterTracker Instance: starting water tracking\n"
      t1 = Thread.new{tracking_time()}
      #aborts on any exception
      t1.abort_on_exception = true
      @thread_id = t1
      return 0

    elsif command == "stop"
      puts "WaterTracker Instance: stopping water tracking\n"
  
      @thread_id.kill
      return 1

    else
      puts "ERROR water.rb: Unknown command #{ command }\n"
      return -1
    end

  end

  def tracking_time()

    while 1 do

      if (@remind_time - Time.now) <= 0
        puts "Glad that's done\n"
        @start_time = Time.now
        @remind_time = @start_time + 10
      end

    end

  end

end
