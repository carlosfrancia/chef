# --- Install packages we need ---
package 'ntp'
package 'sysstat'
package 'apache2'

# --- Add the data partition ---
directory '/mnt/data_joliss'

mount '/mnt/data_joliss' do
  action [:mount, :enable]  # mount and add to fstab
  device 'data_joliss'
  device_type :label
  options 'noatime,errors=remount-ro'
end

service 'apache2' do
  action :restart
end
