#DNS Configuration
#Get already , publicly configured Hosted Zone on Route53 - MUST EXIST, check variables.tf for dns-name
data "aws_route53_zone" "dns" {
  provider = aws.region-master
  name     = var.dns-name
}

#Create record in hosted zone for ACM Certificate Domain verification
//resource "aws_route53_record" "cert_validation" {
//  provider = aws.region-master
//  for_each = {
//    for val in aws_acm_certificate.jenkins-lb-https.domain_validation_options : val.domain_name => {
//      name   = val.resource_record_name
//      record = val.resource_record_value
//      type   = val.resource_record_type
//    }
//  }
//  name    = each.value.name
//  records = [each.value.record]
//  ttl     = 60
//  type    = each.value.type
//  zone_id = data.aws_route53_zone.dns.zone_id
//
//}

#Create Alias record towards ALB from Route53
resource "aws_route53_record" "jenkins" {
  provider = aws.region-master
  zone_id  = data.aws_route53_zone.dns.zone_id
  name     = join(".", ["jenkins", data.aws_route53_zone.dns.name])
  ttl = "300"
  type     = "A"
  records = [aws_instance.jenkins-master.public_ip]
}
