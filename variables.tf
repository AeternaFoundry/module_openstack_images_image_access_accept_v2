variable "images_image_access_accept_v2s" {
  description = <<EOT
Map of images_image_access_accept_v2s, attributes below
Required:
    - image_id
    - status
Optional:
    - member_id
    - region
EOT

  type = map(object({
    image_id  = string
    status    = string
    member_id = optional(string)
    region    = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.images_image_access_accept_v2s : (
        contains(["accepted", "rejected", "pending"], v.status)
      )
    ])
    error_message = "must be one of: \"accepted\", \"rejected\", \"pending\""
  }
}

