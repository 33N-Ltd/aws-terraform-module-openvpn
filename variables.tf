variable "db_instance_type" {
  type    = string
  default = "db.t2.small"
}

variable "rds_master_name" {
  type = string
}

variable "rds_master_password" {
  type = string
}

variable "rds_database_name" {
  default = "openvpndb"
}

variable "rds_cluster_identifier" {
  default = "openvpn-database-cluster"
}

variable "rds_instance_name" {
  default = "openvpn-database-instance"
}

variable "rds_subnet_group" {
  default = "openvpn-db-subnet-group"
}

variable "rds_final_snapshot" {
  default = "openvpn-db-snapshot-final"
}

variable "rds_port" {
  default = "3306"
}

variable "rds_backup_retention_period" {
  type    = string
  default = "7"
}

variable "rds_preferred_backup_window" {
  type    = string
  default = "01:00-03:00"
}

variable "rds_maintenance_window" {
  type    = string
  default = "sun:03:00-sun:04:00"
}

variable "rds_storage_encrypted" {
  default = true
}

variable "iam_role_name" {
  default = "openvpn-iam-role"
}

variable "iam_policy_name" {
  default = "openvpn-iam-policy"
}

variable "iam_instance_profile_name" {
  default = "openvpn-instance-profile"
}

variable "key_name" {
  type        = string
  description = "Set the EC2 Key name"
}

variable "ec2_image_id" {
  description = "Set the AMI ID user for the Launch Configuration"
}

variable "ec2_instance_type" {
  type        = string
  description = "Set EC2 instance type for Openvpn server"
  default     = "t2.small"
}

variable "r53_domain_name" {
  description = "Set the domain name of your OpenVPN deployment"
}

variable "r53_hosted_zone_id" {
  description = "Set the hosted zone id"
}

variable "environment" {
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_range" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "aws_region" {
}

variable "s3_bucket_acl" {
  default = "private"
}

variable "s3_bucket_force_destroy" {
}

variable "s3_bucket_name_ansible" {
}

variable "s3_bucket_policy" {
}

locals {
  environment = substr(var.common_tags["Environment"], 0, 1)
}

variable "bucket_versioning" {
  default = false
}

variable "s3_sse_algorithm" {
  default = "AES256"
}

# Ansible DB Migration
variable "mariadb_repo_url" {
  description = "Set the MariaDB Repo URL"
  default     = "http://yum.mariadb.org/10.1/centos7-amd64"
}

variable "mariadb_repo_enable" {
  description = "Enable the MariaDB repo"
  default     = "yes"
}

variable "mariadb_repo_gpgcheck" {
  description = "Check the GPG key"
  default     = "yes"
}

variable "mariadb_repo_gpg_url" {
  description = "Set the MariaDB repo GPG URL"
  default     = "https://yum.mariadb.org/RPM-GPG-KEY-MariaDB"
}

variable "openvpn_database_user" {
  description = "Set the name of the OpenVPN database user"
  default     = "openvpn-db-user"
}

# Ansible SSL playbook
variable "openvpn_dns_name" {
  description = ""
}

variable "ec2_hostname" {
  description = ""
}

variable "ssl_admin_email" {
  description = "set the email for the certbot ssl"
}

variable "epel_repofile_path" {
  description = "Set the epel repo path"
  default     = "/etc/yum.repos.d/epel.repo"
}

variable "epel_repo_gpg_key_url" {
  description = "Set the repo gpg key"
  default     = "https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7"
}

variable "epel_repo_url" {
  description = "Set the Epel repo url"
  default     = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
}

variable "run_full_system_update" {
  default = false
  description = "Set True or False to run a full system update on the server"
}

variable "run_db_migration_playbook" {
  default = false
}

variable "run_db_restore_playbook" {
  default = false
}

variable "run_ssl_playbook" {
  default = false
}

variable "run_update_server_playbook" {
  default = false
}

# variable "create_new_db" {
#   default = true
# }

# variable "restore_db" {
#   default = false
# }

variable "snapshot_identifier" {
  description = "Set the snapshot you want to restore from"
}