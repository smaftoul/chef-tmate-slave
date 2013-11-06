git "/tmp/tmate-slave" do
  repository "https://github.com/nviennot/tmate-slave.git"
  action :sync
  user "root"
  group "root"
end

script "compile_tmate-slave_part1" do
    interpreter "bash"
      user "root"
      cwd "/tmp/tmate-slave"
      code <<-EOH
        set -e
        bash create_keys.sh > /root/tmate-slave-footprints.txt
        cp -r /tmp/tmate-slave/keys /root/keys/
        cd /tmp/tmate-slave
        ./autogen.sh
        ./configure
        make
      EOH
end
