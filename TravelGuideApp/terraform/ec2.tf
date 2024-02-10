resource "aws_instance" "ec2-db" {
  ami                         = data.aws_ami.ec2-db.id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true
  key_name                    = data.aws_key_pair.ec2_key.key_name
  tags = {
    Name = "ec2-db"
  }

}
