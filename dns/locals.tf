locals {
  records = defaults(var.dns_records, {
    proxied = false
  })

  a_records = {
    for record in local.records : "${record.type}:${record.name}:${record.value}" => record
    if record.type == "A"
  }
  aaaa_records = {
    for record in local.records : "${record.type}:${record.name}:${record.value}" => record
    if record.type == "AAAA"
  }
  cname_records = {
    for record in local.records : "${record.type}:${record.name}:${record.value}" => record
    if record.type == "CNAME"
  }
  mx_records = {
    for record in local.records : "${record.type}:${record.name}:${record.priority}_${record.value}" => record
    if record.type == "MX"
  }
  sshfp_records = {
    for record in local.records : "${record.type}:${record.name}:${record.data.algorithm}.${record.data.type}" => record
    if record.type == "SSHFP"
  }
  txt_records = {
    for record in local.records : "${record.type}:${record.name}:${record.value}" => record
    if record.type == "TXT"
  }
}
