class ChangeDelayedJobsHandler < ActiveRecord::Migration
  def up
    if mysql?
      change_column :delayed_jobs, :handler, :text, :limit => 2**24 - 1
    end
  end

  def down
    if mysql?
      change_column :delayed_jobs, :handler, :text, :limit => 2**16 - 1
    end
  end

  def mysql?
    ActiveRecord::Base.connection.adapter_name =~ /mysql/i
  end
end
