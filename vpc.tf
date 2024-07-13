resource "aws_vpc" "new" {
    cidr_block = "172.168.0.0/16"
    tags = {
        Name = "JSVPC"
    }
}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.new.id
    tags = {
        Name = "myIGW"
    }
}

resource "aws_subnet" "newsub" {
    vpc_id = aws_vpc.new.id 
    cidr_block = "172.168.0.0/24"
    tags = {
        Name = "mysubnet"
    }
}

resource "aws_default_route_table" "route" {
    default_route_table_id = aws_vpc.new.default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
        Name = "Default_Route"
    }
}

resource "aws_default_security_group" "my-sg" {
    vpc_id = aws_vpc.new.id
    ingress {
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        to_port = 8080
        from_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

