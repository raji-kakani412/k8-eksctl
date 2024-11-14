data “aws_ami” “joindevops” {
    most_recent = true
    owners = [“973714476881”] # this info can be received from AWS ami’s section
    
    filter {
        Name = “name”
        Values = [“RHEL-9-Devops-Practice”]
    }
    filter {
        Name = “root-device-type”
        Values = [“EBS”]
    } 
    filter {
        Name = “virtualization-type”
        Values = [“hvm”]
    }
}