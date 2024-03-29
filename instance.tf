resource "aws_instance" "jump" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  
  # the VPC subnet
  subnet_id = "${aws_subnet.auth-poc-public.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykey.key_name}"
  tags = {
    Name = "Jump"
  }
}
