# inside app/jobs/hello_world_job.rb
class NouveauTravail < ApplicationJob
    queue_as :job
  
    def perform(*args)
      # Simulates a long, time-consuming task
      sleep 5
      # Will display current time, milliseconds included
      print( "-------------------------------------------------------------------------------------------------------------
        \n
         Pti criss tu majoute de la job a : #{Time.now().strftime('%F - %H:%M:%S.%L')}
        \n
        -------------------------------------------------------------------------------------------------------------")

      p args
    end
  
  end
  