resource "aws_security_group" "allow_all_k8"{
  
  name = "allow_all_k8"
  description = "Allowing port 22 for SSH access"
    
    # usually we allow everything in egress
  egress { #outgoing traffic and we dont need to authenticate
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #-1 for everything
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # incoming traffic
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_k8"
  }
  
}

# security group resource can be placed below instance resource also . It first creates SG 

resource "aws_instance" "workspace" {

  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_k8.id]
  tags = {
    Name = "workspace"
  }
  user_data = file("userdata.sh")

}
