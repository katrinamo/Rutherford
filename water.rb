# A water tracker is an object that takes commands
# it has a timer


class WaterTracker

  def initialize()
    # "@" means this variable is an INSTANCE variable. Descriptions:
    #   @trackers: a hash table that keeps track of which water tracker
    #              belongs to which user. Allows for multiple water
    #              water trackers to be going on simultaneously
    #   @start_time: start time for an instance of WaterTracker
    #   @remind_time: the time the user will be reminded to drink water
    #                 caluclated by adding one hour in seconds to 
    #                 @start_time
    @trackers = Hash.new(nil)
    @start_time = Time.now
    @remind_time = @start_time + 3600
  end

  def water(command, user)
    if command == "start"
      puts "WaterTracker Instance: starting water tracking\n"
      t1 = Thread.new{tracking_time(user)}
      #aborts on any exception
      t1.abort_on_exception = true
      @trackers[user] = t1
      return 0

    elsif command == "stop"
      puts "WaterTracker Instance: stopping water tracking\n"
      @trackers[user].kill
      return 1

    else
      puts "ERROR water.rb: Unknown command #{ command }\n"
      return -1
    end

  end

  def tracking_time(user)

    while 1 do

      if (@remind_time - Time.now) <= 0
        user.pm("Have you had some water recently? Make sure to keep hydrated! <3")
        puts "Water reminder sent.\n"
        @start_time = Time.now
        @remind_time = @start_time + 3600
      end

    end

  end

end
