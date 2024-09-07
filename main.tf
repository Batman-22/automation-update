resource "aws_instance" "myins" {
    ami = "ami-0522ab6e1ddcc7055"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.newsub.id
    key_name = "jenkins-server-key"
    associate_public_ip_address = true
    tags = {
        Name = "CreatedbyJenkins"
    }
}
