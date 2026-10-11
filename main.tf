resource "google_compute_instance_iam_binding" "compute_instance_iam_bindings" {
  for_each = var.compute_instance_iam_bindings

  instance_name = each.value.instance_name
  members       = each.value.members
  role          = each.value.role
  project       = each.value.project
  zone          = each.value.zone

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

