module PostgresBase
  extend ActiveSupport::Concern
  include Discard::Model


  included do
    establish_connection POSTGRES_DB
    
    self.discard_column = :deleted_at
    self.record_timestamps = true  # automatically fill the created and updated at timestamps
    default_scope -> { kept }

    def destroy
      update_attribute(:deleted_at, Time.now)
    end
  end
end
