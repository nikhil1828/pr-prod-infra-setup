output "vpc_id"{
    value = aws_vpc.vpc.id
}

output "pub_snetid" {
    value = aws_subnet.pub-snet
    #value = {for k, v in aws_subnet.pub-snet:k=>v.id}
}

output "pvt_snetid" {
    value = aws_subnet.pvt-snet
    #value = {for k, v in aws_subnet.pub-snet:k=>v.id}
}