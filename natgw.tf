resource "aws_eip" "auth-poc-nat" {
vpc      = true
}

resource "aws_nat_gateway" "auth-poc-nat-gw" {
allocation_id = "${aws_eip.auth-poc-nat.id}"
subnet_id = "${aws_subnet.auth-poc-public.id}"
depends_on = ["aws_internet_gateway.auth-poc-gw"]
}

resource "aws_route_table" "auth-poc-private" {
    vpc_id = "${aws_vpc.auth-poc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.auth-poc-nat-gw.id}"
    }

    tags {
        Name = "auth-poc-private"
    }
}
# Terraform Training private routes
resource "aws_route_table_association" "moonshot-private-web" {
    subnet_id = "${aws_subnet.auth-poc-private.id}"
    route_table_id = "${aws_route_table.auth-poc-private.id}"
}
