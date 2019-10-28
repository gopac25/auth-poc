# --------------
# Module Outputs
# --------------

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.auth-poc.*.id}"
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${aws_vpc.auth-poc.*.cidr_block}"
}
output "security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = "${aws_security_group.allow-ssh.*.id}"
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = "${aws_route_table.auth-poc-public.*.id}"
}
output "jump_public_subnets" {
  description = "List of IDs of jump public subnets"
  value       = "${aws_subnet.auth-poc-public.*.id}"
}
output "jump_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of junp public subnets"
  value       = "${aws_subnet.auth-poc-public.*.cidr_block}"
}
output "web_private_subnets" {
  description = "List of IDs of web private subnets"
  value       = "${aws_subnet.auth-poc-private.*.id}"
}
output "web_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of web private subnets"
  value       = "${aws_subnet.auth-poc-private.*.cidr_block}"
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = "${aws_eip.auth-poc-nat.*.id}"
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = "${aws_eip.auth-poc-nat.*.public_ip}"
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = "${aws_nat_gateway.auth-poc-nat-gw.*.id}"
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = "${aws_internet_gateway.auth-poc-gw.*.id}"
}

output "jump_server_ip" {
  description = "List of public IPs created for jump server"
  value       = "${aws_instance.jump.*.public_ip}"
}
