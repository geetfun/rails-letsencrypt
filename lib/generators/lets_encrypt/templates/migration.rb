# frozen_string_literal: true

# :nodoc:
class CreateLetsencryptCertificates < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :letsencrypt_certificates do |t|
      t.string   :domain
      t.text     :encrypted_certificate_secret, limit: 65535
      t.text     :encrypted_certificate_secret_iv, limit: 65535
      t.text     :intermediaries, limit: 65535
      t.text     :key, limit: 65535
      t.datetime :expires_at
      t.datetime :renew_after
      t.string   :verification_path
      t.string   :verification_string

      t.index    :domain
      t.index    :renew_after
      t.timestamps
    end
  end
end
