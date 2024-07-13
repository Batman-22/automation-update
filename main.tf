resource "aws_s3" "s3" {
    bucket = "saitama122"
}


resource "aws_instance" "myins" {
    ami = ""
    instance_type = "t2.micro"
    subnet_id = aws_subnet.newsub.id
    key_name = "jenkins-server-key"
    associate_public_ip_address = true
    tags = {
        Name = "CreatedbyJenkins
    }
}