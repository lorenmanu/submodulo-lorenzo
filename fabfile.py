from fabric.api import *
from fabric.colors import green as _green, yellow as _yellow
import boto
import boto.ec2
import time

def create_server():
    """
        Creates EC2 Instance
        """
    print(_green("Started..."))
    print(_yellow("...Creating EC2 instance..."))
    
    conn = boto.ec2.connect_to_region("oregon", aws_access_key_id=ec2_key, aws_secret_access_key=ec2_secret)
    
    image = conn.get_all_images(ec2_amis)
    
    reservation = image[0].run(1, 1, key_name=ec2_key_pair, security_groups=ec2_security,
                               instance_type=ec2_instancetype)
        
    instance = reservation.instances[0]
    conn.create_tags([instance.id], {"Name":config['INSTANCE_NAME_TAG']})
    while instance.state == u'pending':
      print(_yellow("Instance state: %s" % instance.state))
      time.sleep(10)
      instance.update()
                                
    print(_green("Instance state: %s" % instance.state))
    print(_green("Public dns: %s" % instance.public_dns_name))
    
    return instance.public_dns_name