resource "aws_route_table" "route_table" {
  vpc_id =  var.vpc_id

  tags = merge(var.tags,
    {
      Name = var.name
    }
  )
}

/* Route table associations */
resource "aws_route_table_association" "route_table_associate" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.route_table.id
}