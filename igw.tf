# Internet GW
resource "aws_internet_gateway" "auth-poc-gw" {
    vpc_id = "${aws_vpc.auth-poc.id}"

    tags = {
        Name = "auth-poc-gw"
    }
}
