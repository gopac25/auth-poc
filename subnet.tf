# Subnets
resource "aws_subnet" "auth-poc-public" {
    vpc_id = "${aws_vpc.auth-poc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "auth-poc-public"
    }
}
resource "aws_subnet" "auth-poc-private" {
    vpc_id = "${aws_vpc.auth-poc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "auth-poc-private"
    }
}
