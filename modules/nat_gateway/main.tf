resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     =  var.subnet_id
  tags = merge(var.tags,
    {
      Name = var.name
    }
  )
}

resource "aws_eip" "eip" {
  vpc = true
}

