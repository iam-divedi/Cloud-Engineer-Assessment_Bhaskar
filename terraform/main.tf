resource "aws_security_group" "bhaskar_web_sg" {

  name        = "bhaskar-cloud-assessment-sg"
  description = "Security group for Cloud Engineer assessment"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Bhaskar-Assessment-SG"
    Environment = "Assessment"
    Owner       = "Bhaskar Divedi"
  }
}
resource "aws_iam_role" "bhaskar_ec2_role" {

  name = "BhaskarCloudEngineerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Owner = "Bhaskar Divedi"
    Purpose = "Cloud Engineer Assessment"
  }
}
resource "aws_iam_role_policy_attachment" "ssm_policy" {

  role       = aws_iam_role.bhaskar_ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_instance_profile" "bhaskar_profile" {

  name = "bhaskar-cloud-profile"

  role = aws_iam_role.bhaskar_ec2_role.name
}
resource "aws_instance" "bhaskar_ec2" {

  ami           = "ami-084dc2104994adeec"
  instance_type = "t2.micro"

  key_name = "bhaskar-assessment-key"

  iam_instance_profile = aws_iam_instance_profile.bhaskar_profile.name

  vpc_security_group_ids = [
    aws_security_group.bhaskar_web_sg.id
  ]

  tags = {
    Name        = "Bhaskar-Cloud-Assessment"
    Owner       = "Bhaskar Divedi"
    Environment = "Assessment"
  }
}
