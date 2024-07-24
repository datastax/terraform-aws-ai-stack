output "vpc_id" {
  description = "The ID of the VPC used. If created, it's the new ID; if set, it regurgitates the set ID"
  value = try(module.aws_infra[0].vpc_id, null)
}

output "alb_dns_names" {
  description = "The DNS name of the created ALB that the domains for langflow & assistants must be set to"
  value = try(module.aws_infra[0].alb_dns_names, null)
}

output "astra_vector_dbs" {
  description = "A map of DB IDs => DB info for all of the dbs created (from the `assistants` module and the `vector_dbs` module)"
  value = zipmap(concat(module.assistants[*].db_id, values(module.vector_dbs)[*].db_id), concat(module.assistants[*].db_info, values(module.vector_dbs)[*].db_info))
}
