bucket_name = "dev-proj-1-remote-state-bucket"
name        = "environment"
environment = "dev-1"
 
 vpc_cidr               = "11.0.0.0/16"
 vpc_name               = "dev-proj-jenkins-terraform"
 cidr_private_subnet    = ["11.0.1.0/24", "11.0.2.0/24"]
 cidr_public_subnet     = ["11.0.3.0/24", "11.0.4.0/24"]

 ap_availability_zone   = ["ap-southeast-2a", "ap-southeast-2b"]

 public_key             = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPYs3obRsYTW35oklbY5Qr1MkhksaVY3i4hRJHnaJ4Xm dell@d3v1Lc47"
 ec2_ami_id             = "ami-0ba8d27d35e9915fb"

ec2_user_data_install_apache = ""

 domain_name            = "nami.xyz"