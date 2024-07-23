output "vpc_id" {
  value = try(module.aws_infra[0].vpc_id, null)
}

output "alb_dns_names" {
  value = try(module.aws_infra[0].alb_dns_names, null)
}

output "astra_vector_dbs" {
  value = zipmap(concat(module.assistants[*].db_id, values(module.vector_dbs)[*].db_id), concat(module.assistants[*].db_info, values(module.vector_dbs)[*].db_info))
}
