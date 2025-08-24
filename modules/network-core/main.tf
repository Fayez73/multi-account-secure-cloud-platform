resource "aws_vpc" "core" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.name
    Environment = var.env
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.core.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name        = "${var.name}-private-${count.index}"
    Environment = var.env
  }
}

output "vpc_id" {
  value = aws_vpc.core.id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
