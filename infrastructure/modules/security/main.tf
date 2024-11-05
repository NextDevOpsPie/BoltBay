# infrastructure/modules/security/main.tf

resource "aws_security_group" "main" {
  name        = "${var.environment}-main-sg"
  description = "Main security group for ${var.environment}"
  vpc_id      = var.vpc_id

  tags = merge(
    {
      Name        = "${var.environment}-sg"
      Environment = var.environment
      Description = "Security groups for ${var.environment} environment"
    },
    var.tags
  )
}

# Default inbound rule
resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

# Default outbound rule
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}