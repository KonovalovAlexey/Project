#DNS Configuration
#Get already , publicly configured Hosted Zone on Route53 - MUST EXIST, check variables.tf for dns-name
data "aws_route53_zone" "dns" {
  provider = aws.region-app
  name     = var.dns-name
}


#Create Alias record towards ALB from Route53
resource "aws_route53_record" "spring" {
  provider = aws.region-app
  zone_id  = data.aws_route53_zone.dns.zone_id
  name     = join(".", ["pet", data.aws_route53_zone.dns.name])
  ttl = "300"
  type     = "A"
  records = [aws_instance.test_server.public_ip]
}
