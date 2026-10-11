resource "openstack_images_image_access_accept_v2" "images_image_access_accept_v2s" {
  for_each = var.images_image_access_accept_v2s

  image_id  = each.value.image_id
  status    = each.value.status
  member_id = each.value.member_id
  region    = each.value.region
}

