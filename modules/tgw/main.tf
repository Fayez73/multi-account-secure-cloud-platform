resource "aws_ec2_transit_gateway" "tgw" {
  description = "Centralized TGW"
  amazon_side_asn = 64512
  tags = {
    Name        = "central-tgw"
    Environment = var.env
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach" {
  for_each        = var.attach_vpc_ids
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id          = each.value
  subnet_ids      = var.subnet_ids
}
