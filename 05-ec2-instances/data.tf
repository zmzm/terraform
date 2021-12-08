data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}
