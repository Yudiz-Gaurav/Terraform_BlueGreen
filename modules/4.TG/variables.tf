#----------------------------------------------For TG creation---------------------------------------------#
variable "tg_name" {
  description = "Name of Target Group"
  type = string
}

variable "tg_port" {
  description = "Send trffic to this port"
  type = number
}

variable "tg_protocol" {
  description = "Protocol for Target Group"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "target_type" {
  description = "Target Type"
  type = string
}

variable "health_check" {
   type = map(string)
}

#----------------------------------------------For TG Attachment---------------------------------------------#
variable "tg_id" {
  description = "EC2 ID"
  type = string
}

variable "tg_attachment_port" {
  description = "Port of Target Group Attachment"
  type = number
}