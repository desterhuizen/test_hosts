resource "aws_key_pair" "aws-linux" {
  public_key = var.ssh-public-key
}
