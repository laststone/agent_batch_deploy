for line in `cat hosts-1 | awk -F ' ' '{print $1}'`
#for line in `cat hosts`
        do
                ssh-keyscan $line
                #ssh-keyscan $line >> /home/centos/.ssh/known_hosts
                ssh-keyscan $line >> /root/.ssh/known_hosts
        done
