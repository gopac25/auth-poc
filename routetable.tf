# route tables
resource "aws_route_table" "auth-poc-public" {
    vpc_id = "${aws_vpc.auth-poc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.auth-poc-gw.id}"
    }

    tags = {
        Name = "auth-poc-public"
    }
}

# route associations public
resource "aws_route_table_association" "auth-poc-public" {
    subnet_id = "${aws_subnet.auth-poc-public.id}"
    route_table_id = "${aws_route_table.auth-poc-public.id}"
}
